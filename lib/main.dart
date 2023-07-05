import 'package:animation_project/homepage.dart';
import 'package:animation_project/paintdetail.dart';
import 'package:animation_project/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:motion/motion.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(60.fps);


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/': (context) => const HomePage(),
      'detailpage': (context) => const PaintDetail(),
    },
  ));
}