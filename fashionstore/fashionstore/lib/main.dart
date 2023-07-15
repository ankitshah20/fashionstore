import 'package:fashionstore/authentication/forgotton_password.dart';
import 'package:fashionstore/authentication/login_screen.dart';
import 'package:fashionstore/authentication/phone_auth/login_with_phone_number.dart';
import 'package:fashionstore/authentication/register_screen.dart';
import 'package:fashionstore/firebase_options.dart';
import 'package:fashionstore/post/post_apartment.dart';
import 'package:fashionstore/post/post_detail_page.dart';
import 'package:fashionstore/post/post_list_page.dart';
import 'package:fashionstore/post/update_post.dart';
import 'package:fashionstore/profile/profile_page.dart';
import 'package:fashionstore/screen/dashboard_sceen.dart';
import 'package:fashionstore/screen/homescreen.dart';
import 'package:fashionstore/screen/onboarding.dart';
import 'package:fashionstore/screen/slider.dart';
import 'package:fashionstore/settings/setting.dart';
import 'package:fashionstore/settings/term&condition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


bool show = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool("ON_BOARDING") ?? true;
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FashionStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
      routes: {
        IntroScreen.id: (context) => IntroScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        DashboardScreen.id: (context) => const DashboardScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        LoginWithPhoneNumber.id: (context) => const LoginWithPhoneNumber(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        AddProductPage.id: (context) => AddProductPage(),
        ProductPage.id: (context) => ProductPage(),
        ProductDetailPage.id: (context) => ProductDetailPage(),
        UpdatePostPage.id: (context) => UpdatePostPage(),
        ProfileScreen.id: (context) => ProfileScreen(),
        SettingsPage.id: (context) => SettingsPage(),
        TermsOfUse.id: (context) => const TermsOfUse(),
        CarouselS.id: (context) => const CarouselS(),
      },
    );
  }
}
