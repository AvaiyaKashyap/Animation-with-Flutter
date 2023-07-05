import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({super.key});

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  double valueSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4d4c61),
      appBar: AppBar(
        title: Text("R I V E",style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: const Color(0xFF4d4c61),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          RiveAnimation.asset(
            "assets/tree-demo.riv",
            fit: BoxFit.fitWidth,
            onInit: (artboard) {
              controller = StateMachineController.fromArtboard(
                artboard,
                "State Machine 1",
              );

              if(controller != null) {
                artboard.addController(controller!);
                inputValue = controller?.findInput("input");
                inputValue?.change(1);
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 60,
                ),
                child: Slider(
                  activeColor: Colors.green,
                  inactiveColor: Colors.green.withOpacity(0.5),
                  value: valueSlider,
                  onChanged: (v) {
                    setState(() {
                      valueSlider = v;
                    });
                    inputValue?.change(v);
                  },
                  min: 0,
                  max: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
