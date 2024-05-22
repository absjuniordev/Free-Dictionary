import 'package:flutter/material.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _dictionaryProvider = Provider.of<DictionaryProvider>(context);
    final _wordControlle = TextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Dictionary'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _wordControlle,
              decoration: const InputDecoration(
                labelText: "Enter a word",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _dictionaryProvider.fecthWord(_wordControlle.text);
            },
            child: const Text("Search"),
          ),
          FutureBuilder(
              future: _dictionaryProvider.wordFuture,
              builder: (context, snapshot) {
                final word = _dictionaryProvider.word;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (word != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      word.word!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Waiting..."),
                  );
                }
              })
        ],
      ),
    );
  }
}
