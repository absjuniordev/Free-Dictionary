import 'package:flutter/material.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class SelectButtonWidget extends StatefulWidget {
  const SelectButtonWidget({super.key});

  @override
  State<SelectButtonWidget> createState() => _SelectButtonWidgetState();
}

class _SelectButtonWidgetState extends State<SelectButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final injectorStore = getIt<DictionaryProvider>();

    return Padding(
      padding: const EdgeInsets.all(6),
      child: ListenableBuilder(
        listenable: injectorStore,
        builder: (_, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: injectorStore.activeIndex == 0
                    ? const Color.fromARGB(255, 153, 141, 141)
                    : Colors.white,
                elevation: 5,
                child: TextButton(
                  onPressed: () => injectorStore.selectedButton(0),
                  child: const Text(
                    "Words list",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: injectorStore.activeIndex == 1
                    ? const Color.fromARGB(255, 153, 141, 141)
                    : Colors.white,
                elevation: 5,
                child: TextButton(
                  onPressed: () => injectorStore.selectedButton(1),
                  child: const Text(
                    "History",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: injectorStore.activeIndex == 2
                    ? const Color.fromARGB(255, 153, 141, 141)
                    : Colors.white,
                elevation: 5,
                child: TextButton(
                  onPressed: () => injectorStore.selectedButton(2),
                  child: const Text(
                    "Favorites",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
