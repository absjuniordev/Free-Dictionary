import 'package:flutter/material.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import '../views/selected_word_view.dart';
import 'custom_gridview_widget.dart';

class WordsViewWidget extends StatefulWidget {
  const WordsViewWidget({super.key});

  @override
  State<WordsViewWidget> createState() => _WordsViewWidgetState();
}

class _WordsViewWidgetState extends State<WordsViewWidget> {
  final injectorStore = getIt<DictionaryProvider>();
  @override
  void initState() {
    super.initState();
    injectorStore.carregarDadosJson();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOff = MediaQuery.of(context).size.height;
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
                style: TextStyle(
                  fontSize: sizeOff / 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            injectorStore.activeIndex == 0
                ? CustomGridView(
                    favoriteItems: injectorStore.favoriteItems,
                    onFavoriteToggle: injectorStore.onFavoriteToggle,
                    items: injectorStore.wordsAssets.keys.toList(),
                    onTap: (key) {
                      injectorStore.inserterHsitory(key);
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
                        favoriteItems: injectorStore.favoriteItems,
                        onFavoriteToggle: injectorStore.onFavoriteToggle,
                        items: injectorStore.historyWord,
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
                    : CustomGridView(
                        favoriteItems: injectorStore.favoriteItems,
                        onFavoriteToggle: injectorStore.onFavoriteToggle,
                        items: injectorStore.favoriteItems,
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
          ],
        ),
      ),
    );
  }
}
