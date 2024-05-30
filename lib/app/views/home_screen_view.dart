import 'package:flutter/material.dart';
import 'package:free_dicionary/app/widgets/select_button_widget.dart';
import 'package:free_dicionary/app/widgets/words_view_widget.dart';

import '../provider/dictionary_provider.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final injectorStore = getIt<DictionaryProvider>();

    return Scaffold(
      bottomNavigationBar: ListenableBuilder(
        listenable: injectorStore,
        builder: (_, __) => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Words List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: injectorStore.activeIndex,
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          onTap: injectorStore.selectedButton,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromRGBO(42, 117, 207, 100),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              color: const Color.fromRGBO(106, 218, 238, 100),
              child: const WordsViewWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
