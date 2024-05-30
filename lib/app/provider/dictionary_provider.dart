import 'package:flutter/material.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';
import 'package:free_dicionary/app/services/api_service.dart';

class DictionaryProvider extends ChangeNotifier {
  final _apiService = ApiService();
  final List<String> _favoriteItems = [];
  int _activeIndex = 0;

  List<String> get favoriteItems => _favoriteItems;

  int get activeIndex => _activeIndex;

  DictionaryModel? _word;
  DictionaryModel? get word => _word;

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
}
