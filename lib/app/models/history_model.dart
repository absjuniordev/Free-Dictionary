class HistoryModel {
  final int? id;
  final String word;
  final DateTime date;

  HistoryModel({this.id, required this.word, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'date': date.toIso8601String(),
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'],
      word: map['word'],
      date: DateTime.parse(map['date']),
    );
  }
}
