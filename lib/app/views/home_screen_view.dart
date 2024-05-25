import 'package:flutter/material.dart';
import 'package:free_dicionary/app/widgets/select_button_widget.dart';
import 'package:free_dicionary/app/widgets/words_view_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOff = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: const Color.fromRGBO(42, 117, 207, 100),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  color: const Color.fromRGBO(106, 218, 238, 100),
                  child: const WordsViewWidget(),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: -545,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SelectButtonWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
