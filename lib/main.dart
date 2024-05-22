import 'package:flutter/material.dart';
import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:free_dicionary/app/views/home_screen.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Color.fromARGB(255, 185, 7, 7),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
