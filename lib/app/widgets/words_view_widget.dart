import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../views/selected_word_view.dart';

class WordsViewWidget extends StatefulWidget {
  const WordsViewWidget({super.key});

  @override
  State<WordsViewWidget> createState() => _WordsViewWidgetState();
}

class _WordsViewWidgetState extends State<WordsViewWidget> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
          const Card(
            color: Colors.transparent,
            elevation: 50,
            child: Text(
              " Words List",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              itemCount: wordsAssets.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                String key = wordsAssets.keys.elementAt(index);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectedWordView(
                          selectedWord: key,
                        ),
                      ),
                    );
                  },
                  splashColor: const Color.fromARGB(255, 92, 125, 151),
                  child: Card(
                    elevation: 3,
                    child: Center(
                      child: Text(
                        key,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
