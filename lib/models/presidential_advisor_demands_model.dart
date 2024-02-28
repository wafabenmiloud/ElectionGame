// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PresidentialAdvisorDemandsModel {
  final int id;
  final String title;

  final String date;
  PresidentialAdvisorDemandsModel({
    required this.id,
    required this.date,
    required this.title,
   
  });

  PresidentialAdvisorDemandsModel copyWith({
    int? id,
    String? date,
    String? title,
   
  }) {
    return PresidentialAdvisorDemandsModel(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
    
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'title': title,
     
    };
  }

  factory PresidentialAdvisorDemandsModel.fromMap(Map<String, dynamic> map) {
    return PresidentialAdvisorDemandsModel(
      id: map['id'] as int,
      date: map['date'] as String,
      title: map['title'] as String,
     
    );
  }

  String toJson() => json.encode(toMap());

  factory PresidentialAdvisorDemandsModel.fromJson(String source) =>
      PresidentialAdvisorDemandsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PresidentialAdvisorDemandsModel(id: $id,date: $date, title: $title)';

  @override
  bool operator ==(covariant PresidentialAdvisorDemandsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.title == title 
       ;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      date.hashCode ^
      title.hashCode 
     ;
}
