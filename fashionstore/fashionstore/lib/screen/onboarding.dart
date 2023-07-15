import 'package:fashionstore/authentication/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  static const id = "/IntroScreen";
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Connect With Everyone',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        footer: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 45,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 203, 13, 108),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 8),
                onPressed: () {},
                child: const Text("Let's Go", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        image: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('assets/images/welcome.jpg'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Have Access Everywhere!',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        footer: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 197, 9, 87),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 8),
                onPressed: () {},
                child: const Text(
                  "Why to wait!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        image: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/fashionfy.JPG')),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Here We Start!',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        footer: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 45,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 192, 7, 69),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 8),
                onPressed: () {},
                child: const Text("Click  on Done ",
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        image: Container(
          child: Image.asset('assets/images/time.JPG'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntroScreen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Color.fromARGB(255, 218, 120, 8),
            activeSize: Size.square(18),
            activeColor: Color.fromARGB(255, 7, 193, 50),
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 18),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 18),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 20,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }
}
