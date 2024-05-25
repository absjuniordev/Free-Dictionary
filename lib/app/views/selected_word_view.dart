import 'package:flutter/material.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:free_dicionary/app/views/loading_page_view.dart';
import 'package:free_dicionary/app/widgets/audio_play_widget.dart';
import 'package:provider/provider.dart';

class SelectedWordView extends StatelessWidget {
  const SelectedWordView({super.key, required this.selectedWord});
  final String selectedWord;

  @override
  Widget build(BuildContext context) {
    final _dictionaryProvider = Provider.of<DictionaryProvider>(context);
    final word = _dictionaryProvider.fecthWord(selectedWord);
    return FutureBuilder(
      future: word,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPageView();
        } else {
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
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: const Color.fromARGB(255, 175, 173, 100),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(selectedWord),
                            Text(word.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
