import 'package:flutter/material.dart';
class PaintDetail extends StatefulWidget {
  const PaintDetail({super.key});

  @override
  State<PaintDetail> createState() => _PaintDetailState();
}

class _PaintDetailState extends State<PaintDetail> {
  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "painting",
            child: Text("print")),
      ),
    );
  }
}
