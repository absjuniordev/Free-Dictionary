import 'package:flutter/material.dart';
import 'package:free_dicionary/app/widgets/words_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final _dictionaryProvider = Provider.of<DictionaryProvider>(context);

    return const Scaffold(body: WordsView());
  }
}
