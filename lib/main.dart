import 'package:flutter/material.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:free_dicionary/app/views/home_screen_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DictionaryProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreenView(),
      ),
    );
  }
}
