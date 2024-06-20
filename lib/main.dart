import 'package:flutter/material.dart';
import 'package:free_dicionary/core/view_models/dictionary_provider.dart';
import 'package:free_dicionary/core/views/home_screen_view.dart';
import 'package:provider/provider.dart';

import 'core/services/dependency_injection.dart';

void main() {
  setupInjector();
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
