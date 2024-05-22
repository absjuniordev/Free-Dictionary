import 'package:flutter/material.dart';

class DictionaryModel extends ChangeNotifier {
  String? word;
  String? phonetic;
  List<Phonetics>? phonetics;
  String? origin;
  List<Meanings>? meanings;

  DictionaryModel({word, phonetic, phonetics, origin, meanings});

  DictionaryModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    phonetic = json['phonetic'];
    if (json['phonetics'] != null) {
      phonetics = <Phonetics>[];
      json['phonetics'].forEach((v) {
        phonetics!.add(Phonetics.fromJson(v));
      });
    }
    origin = json['origin'];
    if (json['meanings'] != null) {
      meanings = <Meanings>[];
      json['meanings'].forEach((v) {
        meanings!.add(Meanings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    data['phonetic'] = phonetic;
    if (phonetics != null) {
      data['phonetics'] = phonetics!.map((v) => v.toJson()).toList();
    }
    data['origin'] = origin;
    if (meanings != null) {
      data['meanings'] = meanings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phonetics {
  String? text;
  String? audio;

  Phonetics({text, audio});

  Phonetics.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['audio'] = audio;
    return data;
  }
}

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;

  Meanings({partOfSpeech, definitions});

  Meanings.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['partOfSpeech'] = partOfSpeech;
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  String? definition;
  String? example;
  List<String>? synonyms;
  List<String>? antonyms;

  Definitions({definition, example, synonyms, antonyms});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    example = json['example'];
    if (json['synonyms'] != null) {
      synonyms = <String>[];
      json['synonyms'].forEach((v) {
        synonyms!.add(v);
      });
    }
    if (json['antonyms'] != null) {
      antonyms = <String>[];
      json['antonyms'].forEach((v) {
        antonyms!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['definition'] = definition;
    data['example'] = example;
    if (synonyms != null) {
      data['synonyms'] = synonyms!;
    }
    if (antonyms != null) {
      data['antonyms'] = antonyms!;
    }
    return data;
  }
}
