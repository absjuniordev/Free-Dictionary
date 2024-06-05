import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';
import 'package:free_dicionary/app/models/favorite_model.dart';
import 'package:free_dicionary/app/models/history_model.dart';
import 'package:free_dicionary/app/services/api_service.dart';

import '../services/database_service.dart';

class DictionaryProvider extends ChangeNotifier {
  final _apiService = ApiService();
  final _databaseService = DatabaseService();
  double _percentIndication = 0.0;
  final List<String> _favoriteItems = [];
  final List<String> _historyWord = [];
  Map<String, dynamic> _wordsAssets = {};
  int _activeIndex = 0;
  int _clickCount = 0;

  double get percentIndication => _percentIndication;
  int get clickCount => _clickCount;
  List<String> get favoriteItems => _favoriteItems;
  List<String> get historyWord => _historyWord;
  int get activeIndex => _activeIndex;
  DictionaryModel? _word;
  DictionaryModel? get word => _word;

  Map<String, dynamic> get wordsAssets => _wordsAssets;

  DictionaryProvider() {
    carregarDadosJson();
    loadFavoritos();
    loadHistory();
    loadProgress();
  }

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

  Future<void> onFavoriteToggle(String key) async {
    if (_favoriteItems.contains(key)) {
      _favoriteItems.remove(key);
      await _databaseService.deleteFavorite(key);
    } else {
      _favoriteItems.add(key);
      await _databaseService.insertFavorite(FavoriteModel(word: key));
    }
    notifyListeners();
  }

  Future<void> inserterHsitory(String key) async {
    _historyWord.add(key);
    await _databaseService
        .insertHistory(HistoryModel(word: key, date: DateTime.now()));
    notifyListeners();
  }

  Future<void> setPercentIndication() async {
    _clickCount++;
    _percentIndication = _clickCount / wordsAssets.length;
    await _databaseService.inserterProgres(_percentIndication, clickCount);

    if (_percentIndication > 1.0) {
      _percentIndication = 1.0;
      await _databaseService.inserterProgres(_percentIndication, clickCount);
    }

    notifyListeners();
  }

  Future<void> loadFavoritos() async {
    final favorites = await _databaseService.getFavorites();
    _favoriteItems.addAll(favorites.map((f) => f.word));
    notifyListeners();
  }

  Future<void> loadHistory() async {
    final history = await _databaseService.getHistory();
    _historyWord.addAll(history.map((h) => h.word));
    notifyListeners();
  }

  Future<void> loadProgress() async {
    final progress = await _databaseService.getProgress();
    _percentIndication = progress['value'];
    _clickCount = progress['click'];
    notifyListeners();
  }
}
