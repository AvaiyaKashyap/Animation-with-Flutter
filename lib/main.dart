// import 'package:animation_project/homepage.dart';
// import 'package:animation_project/loginpage.dart';
// import 'package:animation_project/paintdetail.dart';
// import 'package:animation_project/splashscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:motion/motion.dart';
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Motion.instance.initialize();
//   Motion.instance.setUpdateInterval(60.fps);

// List<String> _imageUrls = [
//     'https://cdn.discordapp.com/attachments/1005755400202760252/1159091604070600775/Playturf-01.jpg',
//     'https://cdn.discordapp.com/attachments/981192402519879740/1122773847242973245/pngegg.png',
//     'https://cdn.discordapp.com/attachments/981192402519879740/1122772871870173245/107175_circle_facebook_icon.png',
//     // Add more image URLs as needed
//   ];
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(useMaterial3: true),
//     routes: {
//       '/': (context) => const LoginAnimation(),
//       'detailpage': (context) => const PaintDetail(),
//     },
//   ));
// }

//  List<String> _carouselImageUrls = [
//     'https://cdn.discordapp.com/attachments/981192402519879740/1122773847242973245/pngegg.png',
//     'https://cdn.discordapp.com/attachments/1005755400202760252/1159091604070600775/Playturf-01.jpg',
//     'https://cdn.discordapp.com/attachments/981192402519879740/1122772871870173245/107175_circle_facebook_icon.png',
//     // Add more carousel image URLs as needed
//   ];

//   List<String> _rowImageUrls = [
//     'https://cdn.discordapp.com/attachments/981192402519879740/1122772871870173245/107175_circle_facebook_icon.png',
//     'https://cdn.discordapp.com/attachments/981192402519879740/1122773847242973245/pngegg.png',
//     'https://cdn.discordapp.com/attachments/1005755400202760252/1159091604070600775/Playturf-01.jpg',
//     // Add more row image URLs as needed
//   ];

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _carouselIndex = 0;
  int _rowIndex = 0;

 List<String> _carouselImageUrls = [
    'https://cdn.discordapp.com/attachments/981192402519879740/1122773847242973245/pngegg.png',
    'https://cdn.discordapp.com/attachments/1005755400202760252/1159091604070600775/Playturf-01.jpg',
    'https://cdn.discordapp.com/attachments/981192402519879740/1122772871870173245/107175_circle_facebook_icon.png',
    // Add more carousel image URLs as needed
  ];

  List<String> _rowImageUrls = [
    'https://cdn.discordapp.com/attachments/981192402519879740/1122772871870173245/107175_circle_facebook_icon.png',
    'https://cdn.discordapp.com/attachments/981192402519879740/1122773847242973245/pngegg.png',
    'https://cdn.discordapp.com/attachments/1005755400202760252/1159091604070600775/Playturf-01.jpg',
    // Add more row image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Slider Demo'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _carouselIndex = index;
                });
              },
            ),
            items: _carouselImageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.network(
                    url,
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _rowImageUrls.asMap().entries.map((entry) {
              int index = entry.key;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _rowIndex = index;
                    _carouselIndex = index; // Update the carousel index as well
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _rowIndex == index ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    entry.value,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
