import 'package:flutter/material.dart';
import 'package:free_dicionary/app/widgets/custom_popup_menu_button.dart';
import 'package:free_dicionary/app/widgets/words_view_widget.dart';
import '../provider/dictionary_provider.dart';
import '../widgets/card_indication_widget.dart';
import 'selected_word_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final injectorStore = getIt<DictionaryProvider>();
    final sizeOff = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: ListenableBuilder(
        listenable: injectorStore,
        builder: (_, __) => BottomNavigationBar(
          iconSize: sizeOff.width * 0.05,
          selectedFontSize: sizeOff.width * 0.04,
          unselectedFontSize: sizeOff.width * 0.03,
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: sizeOff.height / 50,
            ),
            CustomPopupMenuButton(
              onTap: injectorStore.deleteDatabase,
            ),
            Padding(
              padding: EdgeInsets.only(
                // top: sizeOff.height / 17,
                right: sizeOff.height / 50,
                left: sizeOff.height / 50,
              ),
              child: const CardIndicationWidget(),
            ),
            SizedBox(height: sizeOff.height / 30),
            Expanded(
              child: Container(
                width: sizeOff.width,
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
