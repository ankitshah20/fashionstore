// ignore_for_file: sort_child_properties_last

import 'package:fashionstore/models/add_apartment.dart';
import 'package:fashionstore/models/categories.dart';
import 'package:fashionstore/screen/homescreen.dart';
import 'package:fashionstore/widgets/decoration.dart';
import 'package:fashionstore/widgets/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UpdatePostPage extends StatefulWidget {
  static const id = "/UpdatePostPage";
  @override
  _UpdatePostPageState createState() => _UpdatePostPageState();
}

class _UpdatePostPageState extends State<UpdatePostPage> {
  bool loading = false;

  var categoryC = TextEditingController();
  var productNameC = TextEditingController();
  var detailC = TextEditingController();
  var priceC = TextEditingController();
  var contactC = TextEditingController();
  var addressC = TextEditingController();
  var quantityC = TextEditingController();
  var purposeC = TextEditingController();
  var popularC = TextEditingController();
  bool isPopular = false;
  final _key = GlobalKey<FormState>();
  List<Asset> images = <Asset>[];
  List<String> imageUrls = <String>[];

  save() async {
    bool isValidate = _key.currentState!.validate();
    if (isValidate) {
      await uploadImages();
      ProductModel().addProduct(ProductModel(
        category: categoryC.text,
        productName: productNameC.text,
        detail: detailC.text,
        price: int.parse(priceC.text),
        contact: contactC.text,
        address: addressC.text,
        quantity: int.parse(quantityC.text),
        imagesUrl: imageUrls,
        purpose: purposeC.text,
        isPopular: isPopular,
      ));
    }
  }

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
          "Update Details",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: _key,
            child: ListView(
              children: [
                Container(
                  decoration: decoration(),
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('select category'),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          categoryC.text = value as String;
                          print(categoryC.text);
                        });
                      },
                      value: categories[0].name,
                      items: categories
                          .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  e.name as String,
                                ),
                              )))
                          .toList()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: decoration(),
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return 'should not be empty';
                        }
                        return null;
                      },
                      hint: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('choose purpose'),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          purposeC.text = value as String;
                          print(purposeC.text);
                        });
                      },
                      value: purposes[0].name,
                      items: purposes
                          .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  e.name as String,
                                ),
                              )))
                          .toList()),
                ),
                EditField(
                  validator: (String? v) {
                    if (v == null) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: productNameC,
                  hint: 'Owner full name',
                  onsubmit: (value) {
                    setState(() {
                      productNameC.text = value!;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v == null) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: priceC,
                  hint: 'Total price(NRs.) ',
                  onsubmit: (value) {
                    setState(() {
                      priceC.text = value!;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v == null) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: contactC,
                  hint: ' Contact number',
                  onsubmit: (value) {
                    setState(() {
                      contactC.text = value!;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v == null) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: addressC,
                  hint: ' Full address name',
                  onsubmit: (value) {
                    setState(() {
                      addressC.text = value!;
                    });
                  },
                ),
                EditField(
                  validator: (String? v) {
                    if (v == null) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: quantityC,
                  hint: 'Total quantity(No. of rooms/Apartments)',
                  onsubmit: (value) {
                    setState(() {
                      quantityC.text = value!;
                    });
                  },
                ),
                SwitchListTile(
                    title: const Text('Is this product popular'),
                    value: isPopular,
                    onChanged: (v) {
                      setState(() {
                        isPopular = v;
                      });
                    }),
                SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            loadAsset();
                          },
                          child: const Text('pick images')),
                      Expanded(child: buildGrdiView())
                    ],
                  ),
                ),
                EditField(
                  lines: 8,
                  validator: (String? v) {
                    if (v == null) {
                      return 'should not be empty';
                    }
                    return null;
                  },
                  controller: detailC,
                  hint: 'Enter Details',
                  onsubmit: (value) {
                    setState(() {
                      detailC.text = value!;
                    });
                  },
                ),
                MaterialButton(
                  shape: const StadiumBorder(),
                  onPressed: () {
                    save().then((value) {
                      Utils().toastMessage("Posted Updated Successfully!!!");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                      setState(() {
                        loading = true;
                      });
                    }).onError((error, stackTrace) {
                      debugPrint(error.toString());
                      Utils().toastMessage(error.toString());
                    });
                    setState(() {
                      loading = false;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Update',
                    ),
                  ),
                  color: Colors.blue,
                ),
              ],
            )),
      ),
    );
  }

  loadAsset() async {
    List<Asset> resultImages = <Asset>[];
    String error = "something went wrong";
    try {
      resultImages = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
      );
      setState(() {
        images = resultImages;
      });
    } catch (e) {
      error = e.toString();
      print(error);
    }
  }

  Future postImages(Asset imagefile) async {
    String filename = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage db = FirebaseStorage.instance;
    await db
        .ref()
        .child("images")
        .child(filename)
        .putData((await imagefile.getByteData()).buffer.asUint8List());

    return db.ref().child("images").child(filename).getDownloadURL();
  }

  uploadImages() async {
    for (var image in images) {
      await postImages(image).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  Widget buildGrdiView() {
    return Container(
        width: double.infinity,
        decoration: decoration(),
        child: images.isEmpty
            ? IconButton(
                onPressed: () {
                  loadAsset();
                },
                icon: const Icon(Icons.add),
              )
            : GridView.count(
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child:
                            AssetThumb(asset: asset, width: 150, height: 150)),
                  );
                }),
              ));
  }
}

class EditField extends StatelessWidget {
  @override
  Key? key;
  String? hint;
  void Function(String?)? onsubmit;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  int? lines;
  EditField({
    this.hint,
    this.onsubmit,
    this.controller,
    this.validator,
    this.lines,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
          decoration: decoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              maxLines: lines,
              validator: validator,
              controller: controller,
              onFieldSubmitted: onsubmit,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}


