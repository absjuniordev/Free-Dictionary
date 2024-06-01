import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../provider/dictionary_provider.dart';
import '../views/selected_word_view.dart';

class CardIndicationWidget extends StatelessWidget {
  const CardIndicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOff = MediaQuery.of(context).size;
    final injectorStore = getIt<DictionaryProvider>();

    return Card(
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
                builder: (_, __) => CircularPercentIndicator(
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
                  progressColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
