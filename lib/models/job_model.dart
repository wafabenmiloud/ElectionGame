// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class JobModel {
  final int id;
  final String name;
  JobModel({
    required this.name,
    required this.id,
  });

  JobModel copyWith({
    String? name,
    int? id,
  }) {
    return JobModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JobModel(name: $name, id: $id)';

  @override
  bool operator ==(covariant JobModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
