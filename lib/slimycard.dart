import 'package:flutter/material.dart';
import 'package:flutter_slimy_card/flutter_slimy_card.dart';
import 'package:lottie/lottie.dart';
class SlimyCard extends StatefulWidget {
  const SlimyCard({super.key});

  @override
  State<SlimyCard> createState() => _SlimyCardState();
}

class _SlimyCardState extends State<SlimyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                FlutterSlimyCard(
                  topCardHeight: 160,
                  bottomCardHeight: 120,
                  topCardWidget: topWidget(),
                  bottomCardWidget: bottomWidget(),
                ),
              ],
            ),
          ],
        ));
  }

  topWidget() {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Container(height: 75, child: LottieBuilder.network("https://assets7.lottiefiles.com/packages/lf20_9cv14lsd.json")),
            SizedBox(
              height: 5,
            ),
            Text(
              'A Horse',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  bottomWidget() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          SizedBox(height: 10),
          Flexible(
              child: Text(
                'A horse is a large animal which people can ride. Some horses are used for pulling ploughs and carts. Say Hello to a Funny Hourse.',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
