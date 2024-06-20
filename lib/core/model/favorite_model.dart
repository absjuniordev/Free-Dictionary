class FavoriteModel {
  final int? id;
  final String word;

  FavoriteModel({this.id, required this.word});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      word: map['word'],
    );
  }
}
