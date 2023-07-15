import 'package:fashionstore/authentication/phone_auth/verify_code.dart';
import 'package:fashionstore/widgets/round_bottom.dart';
import 'package:fashionstore/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginWithPhoneNumber extends StatefulWidget {
  static const id = "/LoginWithPhoneNumber";
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/phone.jpg'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: ' +977 9800000000',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RoundButton(
                  title: 'Login',
                  loading: loading,
                  onTap: () {
                    setState(() {
                      loading = true;
                    });
                    auth.verifyPhoneNumber(
                        phoneNumber: phoneNumberController.text,
                        verificationCompleted: (_) {
                          setState(() {
                            loading = false;
                          });
                        },
                        verificationFailed: (e) {
                          setState(() {
                            loading = false;
                          });
                          // Utils().toastMessage(e.toString());
                          Utils().toastMessage("Login With Phone Succeed!!!");
                        },
                        codeSent: (String verificationId, int? token) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyCodeScreen(
                                        verificationId: verificationId,
                                      )));
                          setState(() {
                            loading = false;
                          });
                        },
                        codeAutoRetrievalTimeout: (e) {
                          Utils().toastMessage(e.toString());
                          setState(() {
                            loading = false;
                          });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
