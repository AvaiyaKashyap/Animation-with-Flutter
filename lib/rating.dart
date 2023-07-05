import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class RatingAnimation extends StatefulWidget {
  const RatingAnimation({super.key});

  @override
  State<RatingAnimation> createState() => _RatingAnimationState();
}

class _RatingAnimationState extends State<RatingAnimation> {

  StateMachineController? controller;
  SMIInput<double>? inputValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      body: Center(
        child: RiveAnimation.asset("assets/starts.riv",
          onInit: (art) {
            controller = StateMachineController.fromArtboard(art, "State Machine 1");

            if(controller != null) {
              art.addController(controller!);
              inputValue = controller?.findInput("Rating");
              inputValue?.change(1);
            }
          },
        ),
      ),
    );
  }
}
