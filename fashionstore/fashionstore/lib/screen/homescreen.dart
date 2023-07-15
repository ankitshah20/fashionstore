import 'package:fashionstore/Drawer_section/drawer_header.dart';
import 'package:fashionstore/authentication/login_screen.dart';
import 'package:fashionstore/screen/botton_navigation_bar.dart';
import 'package:fashionstore/settings/setting.dart';
import 'package:fashionstore/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const id = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FashionStore"),
        centerTitle: true,
      ),

      body: const RootApp(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const MyDrawerHeader(),
            //  Menu(),
           
            ListTile(
              leading: const Icon(Icons.settings_applications_rounded),
              title: const Text('Settings'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage())),
            ),
            ListTile(
              leading: const Icon(Icons.notification_important_rounded),
              title: const Text(' Notifications'),
              onTap: () => Navigator.of(context).pushNamed('/addhostel'),
            ),

            ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text(' Send Feedback '),
              onTap: () => Navigator.of(context).pushNamed('/feedback'),
            ),

            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('LogOut'),
              onTap: () {
                auth.signOut().then((value) {
                  Utils().toastMessage("User LogOut Successfully!!!");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
            ),
          ],
        ),
      ), //Deawer
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
