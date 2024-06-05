class ProgressModel {
  final double value;
  final int click;

  ProgressModel({required this.value, required this.click});

  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    return ProgressModel(
      value: json['value'] as double,
      click: json['click'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'click': click,
    };
  }
}
