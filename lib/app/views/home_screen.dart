import 'package:flutter/material.dart';
import 'package:free_dicionary/app/widgets/select_button.dart';
import 'package:free_dicionary/app/widgets/words_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final _dictionaryProvider = Provider.of<DictionaryProvider>(context);

    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 219, 203, 154),
        body: Column(
          children: [
            SizedBox(height: 25),
            Card(
              color: Color.fromARGB(255, 236, 206, 113),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectButton(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("data"),
                  ),
                ],
              ),
            ),
            Expanded(child: WordsView()),
          ],
        ));
  }
}
