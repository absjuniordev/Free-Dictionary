import 'package:flutter/material.dart';
import 'package:free_dicionary/app/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
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
    );
  }
}
