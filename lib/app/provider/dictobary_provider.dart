import 'package:flutter/material.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';
import 'package:free_dicionary/app/services/api_service.dart';

class DictobaryProvider extends ChangeNotifier {
  final _apiService = ApiService();
  DictionaryModel? _word;

  DictionaryModel? get word => _word;

  Future<void> fecthWord(String word) async {
    try {
      _word = await _apiService.fetchWord(word);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to fetch word");
    }
  }
}
