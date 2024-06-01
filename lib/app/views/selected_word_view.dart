import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:free_dicionary/app/views/loading_page_view.dart';
import 'package:get_it/get_it.dart';

import '../widgets/audio_play_widget.dart';

final getIt = GetIt.instance;

class SelectedWordView extends StatelessWidget {
  const SelectedWordView({super.key, required this.selectedWord});
  final String selectedWord;

  @override
  Widget build(BuildContext context) {
    final injectorStore = getIt<DictionaryProvider>();
    final sizeOff = MediaQuery.of(context).size.height;

    return FutureBuilder<DictionaryModel?>(
      future: injectorStore.fetchWord(selectedWord),
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
                  SizedBox(height: sizeOff / 25),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      injectorStore.setPercentIndication();
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(sizeOff / 70),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        height: sizeOff / 3,
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
                                style: TextStyle(fontSize: sizeOff / 20),
                              ),
                              Text(
                                phoneticText ?? "",
                                style: TextStyle(fontSize: sizeOff / 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: sizeOff / 30),
                  AudioPlayWidget(
                    setAudioUrl: audioUrl!,
                  ),
                  Padding(
                    padding: EdgeInsets.all(sizeOff / 70),
                    child: Text(
                      "Meanings",
                      style: TextStyle(
                        fontSize: sizeOff / 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(sizeOff / 70),
                    child: AutoSizeText(
                      '${word.meanings![0].partOfSpeech?[0].toUpperCase()}${word.meanings![0].partOfSpeech!.substring(1)}: ${word.meanings![0].definitions![0].definition}',
                      style: TextStyle(
                        fontSize: sizeOff / 40,
                      ),
                      maxLines: 4,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(sizeOff / 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Voltar",
                                style: TextStyle(
                                  fontSize: sizeOff / 35,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Proximo",
                                style: TextStyle(
                                  fontSize: sizeOff / 35,
                                  color: Colors.black,
                                ),
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
