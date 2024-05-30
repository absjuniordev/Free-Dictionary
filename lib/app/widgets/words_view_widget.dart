import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';

import '../views/selected_word_view.dart';
import 'custom_gridview_widget.dart';

class WordsViewWidget extends StatefulWidget {
  const WordsViewWidget({super.key});

  @override
  State<WordsViewWidget> createState() => _WordsViewWidgetState();
}

class _WordsViewWidgetState extends State<WordsViewWidget> {
  Map<String, dynamic> _wordsAssets = {};
  final List<String> _historyWord = [];

  @override
  void initState() {
    super.initState();
    _carregarDadosJson();
  }

  Future<void> _carregarDadosJson() async {
    String jsonString =
        await rootBundle.loadString('assets/words/words_dictionary.json');
    setState(() {
      _wordsAssets = json.decode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    final injectorStore = getIt<DictionaryProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListenableBuilder(
        listenable: injectorStore,
        builder: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.transparent,
              elevation: 50,
              child: Text(
                injectorStore.activeIndex == 0
                    ? "Words List"
                    : injectorStore.activeIndex == 1
                        ? "History"
                        : "Favorites",
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const Divider(),
            injectorStore.activeIndex == 0
                ? CustomGridView(
                    items: _wordsAssets.keys.toList(),
                    onTap: (key) {
                      _historyWord.insert(0, key);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedWordView(
                            selectedWord: key,
                          ),
                        ),
                      );
                    },
                  )
                : injectorStore.activeIndex == 1
                    ? CustomGridView(
                        items: _historyWord,
                        onTap: (key) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectedWordView(
                                selectedWord: key,
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(child: Text("Favorites")),
          ],
        ),
      ),
    );
  }
}
