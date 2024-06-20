import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../view_models/dictionary_provider.dart';
import '../selected_word_view.dart';

class CardIndicationWidget extends StatelessWidget {
  const CardIndicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOff = MediaQuery.of(context).size;
    final injectorStore = getIt<DictionaryProvider>();

    final List<String> imagesPath = [
      "assets/images/mascot.jpg",
      "assets/images/mascot2.jpg",
      "assets/images/mascot3.jpg",
      "assets/images/mascot4.jpg",
    ];

    return Card(
      color: Colors.grey[170],
      elevation: 3,
      child: SizedBox(
        height: sizeOff.height / 5,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ListenableBuilder(
                listenable: injectorStore,
                builder: (_, __) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularPercentIndicator(
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      radius: sizeOff.height / 15,
                      lineWidth: sizeOff.width / 30,
                      percent: injectorStore.percentIndication,
                      center: Text(
                        "${injectorStore.percentIndication.toStringAsFixed(2)}%",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      progressColor: const Color.fromRGBO(42, 117, 207, 100),
                      backgroundColor: const Color.fromRGBO(106, 218, 238, 100),
                    ),
                    Text(
                      "Your progress",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: sizeOff.width / 37),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: double.infinity,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.bounceInOut,
                    pauseAutoPlayOnTouch: false,
                    viewportFraction: 0.8,
                  ),
                  items: imagesPath.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
