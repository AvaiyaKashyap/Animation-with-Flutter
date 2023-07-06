import 'dart:math';
import 'package:animation_project/customscroll.dart';
import 'package:animation_project/liquidswipe.dart';
import 'package:animation_project/loginpage.dart';
import 'package:animation_project/parallax.dart';
import 'package:animation_project/rating.dart';
import 'package:animation_project/rive.dart';
import 'package:animation_project/slimycard.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children:[
        Scaffold(
        appBar: AppBar(
          title: const Text("H O M E P A G E"),
          actions: const [
            LikeButton(),
            SizedBox(width: 20,),
          ],
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                if(isPlaying){
                  _controller.stop();
                }
                else{
                  _controller.play();
                }
                isPlaying = !isPlaying;
              }, child: Text("Click Me!")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Example()),
                );
              }, child: Text("Slimy Card")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SimpleAnimation()),
                );
              }, child: Text("Rive Animation")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParallaxEffectScroll()),
                );
              }, child: Text("Parallax Scrolling")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomScroll()),
                );
              }, child: Text("Custom Scrolling")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginAnimation()),
                );
              }, child: Text("LoginUI Animation")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingAnimation()),
                );
              }, child: Text("Rating Animation")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LiquidSwipeAnimation()),
                );
              }, child: Text("Swipe Animation")),
            ],
          ),
        ),
      ),
        ConfettiWidget(
          confettiController: _controller,
          //blastDirection: pi / 2,
          emissionFrequency: 1,
          maximumSize: Size(10,10),
          minimumSize: Size(10,10),
          numberOfParticles: 5,
          gravity: 0,
          blastDirectionality: BlastDirectionality.explosive,
          // colors: [
          //   Colors.red,
          //   Colors.green,
          //   Colors.black,
          //   //Colors.blue,
          // ],
        ),
    ],
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double spaceBetween = 10.0;
  final _duration = Duration(milliseconds: 200);


  _onStartScroll(ScrollMetrics metrics) {
    // if you need to do something at the start
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    // do your magic here to change the value
    if(spaceBetween == 30.0) return;
    spaceBetween = 30.0;
    setState((){});
  }

  _onEndScroll(ScrollMetrics metrics) {
    // do your magic here to return the value to normal
    spaceBetween = 10.0;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          _onStartScroll(scrollNotification.metrics);
        } else if (scrollNotification is ScrollUpdateNotification) {
          _onUpdateScroll(scrollNotification.metrics);
        } else if (scrollNotification is ScrollEndNotification) {
          _onEndScroll(scrollNotification.metrics);
        }
        return true; // see docs
      },
      child: ListView(
        children: [
          Container(height: 100, width: 100, color: Colors.red),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.blue),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.red),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.blue),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.red),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.blue),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.red),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.blue),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.red),
          AnimatedContainer(duration: _duration, height: spaceBetween),
          Container(height: 100, width: 100, color: Colors.blue),
          AnimatedContainer(duration: _duration, height: spaceBetween),
        ],
      ),
    );
  }
}
