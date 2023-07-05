import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10),
            ()=> Navigator.of(context).push(_createRoute()),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: LottieBuilder.asset(
            "assets/loading_delivery.json",
          )),
          SizedBox(
            height: 80,
            width: 400,
            child: LottieBuilder.asset("assets/loading_bar.json",fit: BoxFit.cover,),
          ),
          Text("Loading..."),
          SizedBox(
            height: 150
          ),
          SizedBox(
              height: 100,
              width: 100,
              child: LottieBuilder.asset(
                  "assets/loading_dots.json")),
        ],
      ),
    );
  }
}
