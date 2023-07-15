// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class SliderScreen extends StatefulWidget {
//   const SliderScreen({super.key});

//   @override
//   State<SliderScreen> createState() => _SliderScreenState();
// }

// class _SliderScreenState extends State<SliderScreen> {
//   List imageList = [
//     {"id": 1, "image_path": 'assets/images/banner.png'},
//     {"id": 2, "image_path": 'assets/images/bestsellersbanner.png'},
//     {"id": 3, "image_path": 'assets/images/banner.png'}
//   ];
//   final CarouselController carouselController = CarouselController();
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Slider Example"),
//       ),
//       body: Column(children: [
//         Stack(
//           children: [
//             InkWell(
//               onTap: () {
//                 print(currentIndex);
//               },
//               child: CarouselSlider(
//                 items: imageList
//                     .map(
//                       (item) => Image.asset(
//                         item['image_path'],
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ),
//                     )
//                     .toList(),
//                 carouselController: carouselController,
//                 options: CarouselOptions(
//                   scrollPhysics: const BouncingScrollPhysics(),
//                   autoPlay: true,
//                   aspectRatio: 2,
//                   viewportFraction: 1,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       currentIndex = index;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 10,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: imageList.asMap().entries.map((entry) {
//                   return GestureDetector(
//                     onTap: () => carouselController.animateToPage(entry.key),
//                     child: Container(
//                       width: currentIndex == entry.key ? 17 : 7,
//                       height: 7.0,
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 3.0,
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: currentIndex == entry.key
//                               ? Colors.red
//                               : Colors.teal),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ]),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselS extends StatefulWidget {
  static const id = "/CarouselS";
  const CarouselS({super.key});

  @override
  State<CarouselS> createState() => _CarouselSState();
}

class _CarouselSState extends State<CarouselS> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/boysbanner.jpg'},
    {"id": 2, "image_path": 'assets/images/girlsbanner.JPG'},
    {"id": 3, "image_path": 'assets/images/girlsbanner2.JPG'},
    {"id": 4, "image_path": 'assets/images/girlsbanner3.JPG'}
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.red
                              : Colors.teal),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
