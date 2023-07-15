import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to our About Us page!',
              style: GoogleFonts.comfortaa(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              child: Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_lstcbn9k.json'),
            ),
            const SizedBox(height: 16.0),
            Text(
                'Hirexxo is also an online application will be used to find the accommodation, residents \(apartment, flats, rooms, building & houses) services for the tenants. \It will be an online application which provides a list of buildings, apartments & rooms for rental purposes in different places (Kathmandu, Bhaktapur & Lalitpur metropolitan cities) of valley.  ',
                textAlign: TextAlign.justify,
                style: GoogleFonts.comfortaa()),
            const SizedBox(height: 30.0),
            Text(
              'Thank you for using our app!',
              style: GoogleFonts.comfortaa(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
