import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';
import 'package:free_dicionary/app/services/api_service.dart';

class DictionaryProvider extends ChangeNotifier {
  final _apiService = ApiService();
  double _percentIndication = 0.0;
  final List<String> _favoriteItems = [];
  Map<String, dynamic> _wordsAssets = {};
  int _activeIndex = 0;
  int _clickCount = 0;

  double get percentIndication => _percentIndication;
  int get clickCount => _clickCount;
  List<String> get favoriteItems => _favoriteItems;

  int get activeIndex => _activeIndex;

  DictionaryModel? _word;
  DictionaryModel? get word => _word;

  Map<String, dynamic> get wordsAssets => _wordsAssets;

  Future<void> carregarDadosJson() async {
    String jsonString =
        await rootBundle.loadString('assets/words/words_dictionary.json');

    _wordsAssets = json.decode(jsonString);
    notifyListeners();
  }

  Future<DictionaryModel> fetchWord(String word) async {
    try {
      _word = await _apiService.getDataApi(word);
      notifyListeners();
      return _word!;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Failed to fetch word");
    }
  }

  selectedButton(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  onFavoriteToggle(String key) {
    if (_favoriteItems.contains(key)) {
      _favoriteItems.remove(key);
    } else {
      _favoriteItems.add(key);
    }
    notifyListeners();
  }

  void setPercentIndication() {
    _clickCount++;
    _percentIndication = _clickCount / wordsAssets.length;

    if (_percentIndication > 1.0) {
      _percentIndication = 1.0;
    }

    notifyListeners();
  }
}
