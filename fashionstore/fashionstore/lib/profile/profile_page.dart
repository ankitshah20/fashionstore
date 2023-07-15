// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionstore/widgets/profile/pbutton.dart';
import 'package:fashionstore/widgets/profile/ptextform.dart';
import 'package:fashionstore/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class ProfileScreen extends StatefulWidget {
  static const id = 'ProfileScreen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // const ProfileScreen({Key? key}) : super(key: key);
  String? profilePic;
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? downloadUrl;
  bool selection = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic>? data;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (FirebaseAuth.instance.currentUser!.displayName == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('please complete profile firstly')));
      } else {
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get()
            .then((DocumentSnapshot<Map<String, dynamic>> snapshot) {
          nameC.text = snapshot['name'];
          phoneC.text = snapshot['phone'];
          cityC.text = snapshot['city'];
          emailC.text = snapshot['email'];
          addressC.text = snapshot['address'];
          profilePic = snapshot['profilePic'];
        });
      }
    });
    super.initState();
  }

  bool isSaving = false;
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 213, 120, 120),
            ),
          ),
        ),
        backgroundColor: Colors.green,
        title: const Text(
          "Profile Page",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    "PROFILE",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        final XFile? pickImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 50,
                        );
                        if (pickImage != null) {
                          setState(() {
                            profilePic = pickImage.path;
                            selection = true;
                          });
                        }
                      },
                      child: Container(
                        child: profilePic == null
                            ? CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.deepPurple,
                                child: Image.asset(
                                  'assets/images/sanjiv.jpg',
                                  height: 80,
                                  width: 80,
                                ),
                              )
                            : profilePic!.contains('http')
                                ? CircleAvatar(
                                    radius: 70,
                                    backgroundImage: NetworkImage(profilePic!),
                                  )
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        FileImage(File(profilePic!)),
                                  ),
                      ),
                    ),
                  ),
                  PTextField(
                    hintText: "enter full name",
                    controller: nameC,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "should not be empty";
                      }
                      return null;
                    },
                  ),
                  PTextField(
                    hintText: "enter phoneNumber",
                    controller: phoneC,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "should not be empty";
                      }
                      return null;
                    },
                  ),
                  PTextField(
                    hintText: "enter email ",
                    controller: emailC,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "should not be empty";
                      }
                      return null;
                    },
                  ),
                  PTextField(
                    hintText: "enter city",
                    controller: cityC,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "should not be empty";
                      }
                      return null;
                    },
                  ),
                  PTextField(
                    hintText: "enter full address",
                    controller: addressC,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "should not be empty";
                      }
                      return null;
                    },
                  ),
                  PButton(
                    title: nameC.text.isEmpty ? 'SAVE' : 'Update',
                    isLoginButton: true,
                    isLoading: isSaving,
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        SystemChannels.textInput.invokeMapMethod(
                            'TextInput.hide'); // hides keyboard
                        profilePic == null
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('select profile pic')))
                            : nameC.text.isEmpty
                                ? saveInfo()
                                : update();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> uploadImage(File filepath, String? reference) async {
    try {
      final finalName =
          '${FirebaseAuth.instance.currentUser!.uid}${DateTime.now().second}';
      final Reference fbStorage =
          FirebaseStorage.instance.ref(reference).child(finalName);
      final UploadTask uploadTask = fbStorage.putFile(filepath);
      await uploadTask.whenComplete(() async {
        downloadUrl = await fbStorage.getDownloadURL();
      });

      return downloadUrl;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  update() {
    setState(() {
      isSaving = true;
    });
    if (selection == true) {
      uploadImage(File(profilePic!), 'profile').whenComplete(() {
        Map<String, dynamic> data = {
          'name': nameC.text,
          'phone': phoneC.text,
          'email': emailC.text,
          'city': cityC.text,
          'address': addressC.text,
          'profilePic': downloadUrl,
        };
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(data)
            .whenComplete(() {
          FirebaseAuth.instance.currentUser!
              .updateDisplayName(nameC.text)
              .then((value) {
            Utils().toastMessage("User Profile Updated Successfully!!!");

            setState(() {
              isSaving = true;
            });
          }).onError((error, stackTrace) {
            debugPrint(error.toString());
            Utils().toastMessage(error.toString());
          });
          setState(() {
            isSaving = false;
          });
        });
      });
      
    } else {
      Map<String, dynamic> data = {
        'name': nameC.text,
        'phone': phoneC.text,
        'email': emailC.text,
        'city': cityC.text,
        'address': addressC.text,
        'profilePic': profilePic,
      };
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(data)
          .whenComplete(() {
        FirebaseAuth.instance.currentUser!.updateDisplayName(nameC.text);
        setState(() {
          isSaving = false;
        });
      });
    }
  }

  saveInfo() {
    setState(() {
      isSaving = true;
    });
    uploadImage(File(profilePic!), 'profile').whenComplete(() {
      Map<String, dynamic> data = {
        'name': nameC.text,
        'phone': phoneC.text,
        'email': emailC.text,
        'city': cityC.text,
        'address': addressC.text,
        'profilePic': downloadUrl,
      };
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(data)
          .whenComplete(() {
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(nameC.text)
            .then((value) {
          Utils().toastMessage("Profile Data Saved Successfully!!!");

          setState(() {
            isSaving = true;
          });
        }).onError((error, stackTrace) {
          debugPrint(error.toString());
          Utils().toastMessage(error.toString());
        });
        setState(() {
          isSaving = false;
        });
      });
    });
  }
}
