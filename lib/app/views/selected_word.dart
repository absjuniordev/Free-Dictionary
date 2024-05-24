import 'package:flutter/material.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:free_dicionary/app/widgets/audio_play_widget.dart';
import 'package:provider/provider.dart';

class SelectedWord extends StatelessWidget {
  const SelectedWord({super.key, required this.selectedWord});
  final String selectedWord;

  @override
  Widget build(BuildContext context) {
    final _dictionaryProvider = Provider.of<DictionaryProvider>(context);
    final word = _dictionaryProvider.fecthWord(selectedWord);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 203, 154),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
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
                color: const Color.fromARGB(255, 199, 151, 207),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hello"),
                    Text("he'lo"),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
