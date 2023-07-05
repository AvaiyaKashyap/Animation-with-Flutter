import 'package:flutter/material.dart';

import 'data.dart';

class CustomScroll extends StatefulWidget {
  const CustomScroll({super.key});

  @override
  State<CustomScroll> createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
  ScrollController controller = ScrollController();
  double topContainer = 0;
  bool closeTopContainer = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 100;
      setState(() {
        topContainer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vincent Williams paintings"),
      ),
      body: ListView.builder(
      physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        controller: controller,
        itemCount: paintings.length,
        itemBuilder: (context, i) {
          double scale = 1.0;
          if (topContainer > 1) {
            scale = i + 0.9 - topContainer;
            if (scale < 0) {
              scale = 0;
            } else if (scale > 1) {
              scale = 1;
            }
          }
          return Opacity(
            opacity: scale,
            child: Transform(
              transform: Matrix4.identity()..scale(scale, scale),
              alignment: Alignment.bottomCenter,
              child: Align(
                heightFactor: 0.6,
                alignment: Alignment.topCenter,
                  child: GestureDetector(
                    // onTap: () {
                    //   Navigator.of(context)
                    //       .pushNamed('detailpage', arguments: i);
                    // },
                    child: Container(
                      height: 200,
                      width: 300,
                      //color: Colors.black12,
                      decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 20.0,
                            color: Colors.black38
                            //color: Color(0xff4e4e4e12),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "${paintings[i]['image']}",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              ),
            );
        },
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     // SliverAppBar(
      //     //   pinned: true,
      //     //   floating: true,
      //     //   expandedHeight: 160.0,
      //     //   // collapsedHeight: 160,
      //     //   backgroundColor: Colors.purple[400],
      //     //   flexibleSpace: FlexibleSpaceBar(
      //     //     title: Text(
      //     //       "Vincent Willem Paintings",
      //     //       style: TextStyle(
      //     //         fontSize: 20,
      //     //       ),
      //     //     ),
      //     //     centerTitle: true,
      //     //     background: Image.network(
      //     //       "https://d31xsmoz1lk3y3.cloudfront.net/games/images/1451534798_van_Gogh_paintings_Pic_Click",
      //     //       fit: BoxFit.cover,
      //     //     ),
      //     //   ),
      //     // ),
      //     SliverList(
      //       delegate:
      //           SliverChildBuilderDelegate((BuildContext context, int index) {
      //         return ListView.builder(
      //           physics: BouncingScrollPhysics(),
      //           shrinkWrap: true,
      //           controller: controller,
      //           itemCount: paintings.length,
      //           itemBuilder: (context, i) {
      //             double scale = 1.0;
      //             if (topContainer > 0.5) {
      //               scale = i + 0.5 - topContainer;
      //               if (scale < 0) {
      //                 scale = 0;
      //               } else if (scale > 1) {
      //                 scale = 1;
      //               }
      //             }
      //             return Opacity(
      //               opacity: scale,
      //               child: Transform(
      //                 transform: Matrix4.identity()..scale(scale, scale),
      //                 alignment: Alignment.bottomCenter,
      //                 child: Align(
      //                   heightFactor: 0.7,
      //                   alignment: Alignment.topCenter,
      //                   child: Container(
      //                     height: 200,
      //                     width: 300,
      //                     color: Colors.black12,
      //                     // child: ClipRRect(
      //                     //     borderRadius: BorderRadius.circular(20),
      //                     //     child: Image.asset(
      //                     //       "${paintings[i]['image']}",
      //                     //       fit: BoxFit.cover,
      //                     //     )),
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         );
      //       }),
      //     ),
      //   ],
      // ),
    );
  }
}
