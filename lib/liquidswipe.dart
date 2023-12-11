// import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// class LiquidSwipeAnimation extends StatefulWidget {
//   const LiquidSwipeAnimation({super.key});
//
//   @override
//   State<LiquidSwipeAnimation> createState() => _LiquidSwipeAnimationState();
// }
//
// class _LiquidSwipeAnimationState extends State<LiquidSwipeAnimation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LiquidSwipe(pages: [
//
//       ]),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';



class LiquidSwipeAnimation extends StatelessWidget {
  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "timesBold");

  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "timesBold");

  static const TextStyle greyStyle =
  TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "timesBold");
  static const TextStyle whiteStyle =
  TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "timesBold");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 50.0,
    color: Colors.black,
    fontFamily: "timesBold",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "timesBold",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "timesBold",
  );

  final pages = [
    Container(
      color: Colors.red[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "vincent van gogh",
                  style: goldcoinGreyStyle,
                ),
                Text(
                  "Paintings",
                  style: goldcoinGreyStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/painting2.jpg")),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "The Starry Night",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                 "The Starry Night is an oil-on-canvas painting by the Dutch Post-Impressionist painter Vincent van Gogh.",
                  style: descriptionGreyStyle,
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.green[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "vincent van gogh",
                  style: goldcoinGreyStyle,
                ),
                Text(
                  "Paintings",
                  style: goldcoinGreyStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/painting3.jpg")),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "The Potato Eaters",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "The Potato Eaters is an oil painting by Dutch artist Vincent van Gogh painted in April 1885 in Nuenen",
                  style: descriptionGreyStyle,
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.blue[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "vincent van gogh",
                  style: goldcoinGreyStyle,
                ),
                Text(
                  "Paintings",
                  style: goldcoinGreyStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/painting4.jpg")),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Irises",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Irises is one of several paintings of irises by the Dutch artist Vincent van Gogh, and one of a series of paintings he made at the Saint Paul-de-Mausole",
                  style: descriptionGreyStyle,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ];

  LiquidSwipeAnimation({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: pages,
          enableLoop: false,
          fullTransitionValue: 500,
          //enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.1,
        ),
      ),
    );
  }
}
