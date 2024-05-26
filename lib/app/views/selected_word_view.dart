import 'package:flutter/material.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:free_dicionary/app/views/loading_page_view.dart';
import 'package:provider/provider.dart';

import '../widgets/audio_play_widget.dart';

class SelectedWordView extends StatelessWidget {
  const SelectedWordView({super.key, required this.selectedWord});
  final String selectedWord;

  @override
  Widget build(BuildContext context) {
    final dictionaryProvider =
        Provider.of<DictionaryProvider>(context, listen: false);

    return FutureBuilder<DictionaryModel?>(
      future: dictionaryProvider.fetchWord(selectedWord),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPageView();
        } else {
          final word = snapshot.data!;

          final phoneticText =
              word.phonetics != null && word.phonetics!.isNotEmpty
                  ? word.phonetics!
                      .firstWhere(
                        (phonetic) =>
                            phonetic.text != null && phonetic.text!.isNotEmpty,
                        orElse: () => Phonetics(text: ""),
                      )
                      .text
                      ?.replaceAll('/', '')
                  : "";
          final audioUrl = word.phonetics![0].audio;

          return Scaffold(
            body: Container(
              color: const Color.fromRGBO(106, 218, 238, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: const Color.fromRGBO(255, 175, 173, 100),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                word.word!,
                                style: const TextStyle(fontSize: 30),
                              ),
                              Text(
                                phoneticText ?? "",
                                style: const TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AudioPlayWidget(
                    setAudioUrl: audioUrl!,
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Meanings",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${word.meanings![0].partOfSpeech?[0].toUpperCase()}${word.meanings![0].partOfSpeech!.substring(1)}: ${word.meanings![0].definitions![0].definition}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Voltar",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Proximo",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
