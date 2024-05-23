import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WordsView extends StatefulWidget {
  const WordsView({super.key});

  @override
  State<WordsView> createState() => _WordsViewState();
}

class _WordsViewState extends State<WordsView> {
  Map<String, dynamic> wordsAssets = {};
  @override
  void initState() {
    super.initState();
    _carregarDadosJson();
  }

  Future<void> _carregarDadosJson() async {
    String jsonString =
        await rootBundle.loadString('assets/words/words_dictionary.json');
    setState(() {
      wordsAssets = json.decode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: wordsAssets.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        String key = wordsAssets.keys.elementAt(index);
        return Card(
          child: ListTile(
            title: Text(key),
          ),
        );
      },
    );
  }
}
