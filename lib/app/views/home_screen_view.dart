import 'package:flutter/material.dart';
import 'package:free_dicionary/app/widgets/words_view_widget.dart';
import '../provider/dictionary_provider.dart';
import 'selected_word_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final injectorStore = getIt<DictionaryProvider>();
    final size = MediaQuery.of(context).size;

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
          selectedItemColor: Colors.blue,
          onTap: injectorStore.selectedButton,
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(106, 218, 238, 100),
        child: Column(
          children: [
            SizedBox(height: size.height * .22),
            Expanded(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(42, 117, 207, 100),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const WordsViewWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
