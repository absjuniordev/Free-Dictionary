import 'package:flutter/material.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';
import 'package:free_dicionary/app/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _appService = ApiService();
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
                  labelText: "Enter a word", border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Search"),
          ),
          FutureBuilder<DictionaryModel>(
            future: _appService.fetchWord("word"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                final word = snapshot.data!;
                return Center(child: Text(word.word!));
              }
            },
          ),
        ],
      ),
    );
  }
}
