// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LanguageModel {
  final String imagePath;
  final String title;
  final String languageCode;
  LanguageModel({
    required this.imagePath,
    required this.title,
    required this.languageCode,
  });

  LanguageModel copyWith({
    String? imagePath,
    String? title,
    String? languageCode,
  }) {
    return LanguageModel(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
      'title': title,
      'languageCode': languageCode,
    };
  }

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      imagePath: map['imagePath'] as String,
      title: map['title'] as String,
      languageCode: map['languageCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguageModel.fromJson(String source) =>
      LanguageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LanguageModel(imagePath: $imagePath, title: $title, languageCode: $languageCode)';

  @override
  bool operator ==(covariant LanguageModel other) {
    if (identical(this, other)) return true;

    return other.imagePath == imagePath &&
        other.title == title &&
        other.languageCode == languageCode;
  }

  @override
  int get hashCode =>
      imagePath.hashCode ^ title.hashCode ^ languageCode.hashCode;
}
