import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:free_dicionary/app/models/dictionary_model.dart';

class ApiService {
  final dio = Dio();
  static const _pathApi = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  Future<DictionaryModel> fetchWord(String word) async {
    try {
      final response = await dio.get("$_pathApi");
      return DictionaryModel.fromJson(response.data[0]);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("Word not found");
    }
  }
}
