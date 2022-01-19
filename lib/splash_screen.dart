import 'package:flutter/material.dart';
import 'package:pisyst_assignment/register.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashSlide extends StatefulWidget {
  const SplashSlide({Key? key}) : super(key: key);

  @override
  _SplashSlideState createState() => _SplashSlideState();
}

class _SplashSlideState extends State<SplashSlide> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Register(),
      image: Image.asset('assets/images/logo.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.deepOrange,
      photoSize: 100,
    );
  }
}
