import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 230, 231, 236),
      width: double.infinity,
      height: 280,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.JPG'),
              ),
            ),
          ),
          const Text(
            //"${loggedInUser.firstName} ${loggedInUser.secondName}""
            " FashionStore",
            style: TextStyle(color: Color.fromARGB(255, 5, 151, 47), fontSize: 30),
          ),
          const Text(
            // "${loggedInUser.email}"
            " fashion1@gmail.com",
            style: TextStyle(color: Color.fromARGB(255, 8, 192, 17), fontSize: 20),
          ),
        ],
      ),
    );
  }
}





