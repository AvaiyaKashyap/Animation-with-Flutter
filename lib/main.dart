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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _carouselController = CarouselController();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel and PageView Sync'),
      ),
      body: Column(
        children: [
          // Carousel Slider
          CarouselSlider(
            items: [
              // Your carousel items go here
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text('Page 1'),
                ),
              ),
              Container(
                color: Colors.red,
                child: Center(
                  child: Text('Page 2'),
                ),
              ),
              // Add more items as needed
            ],
            carouselController: _carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                // Update PageView index when carousel slider is swiped
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              // Add other carousel options as needed
            ),
          ),

          // PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                // Your page view items go here
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Page 1'),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text('Page 2'),
                  ),
                ),
                // Add more items as needed
              ],
              onPageChanged: (index) {
                // Update carousel slider index when page view is swiped
                _carouselController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
