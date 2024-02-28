// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ResourceTypesModel {
  final int id;
  final String name;
  ResourceTypesModel({
    required this.name,
    required this.id,
  });

  ResourceTypesModel copyWith({
    String? name,
    int? id,
  }) {
    return ResourceTypesModel(
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

  factory ResourceTypesModel.fromMap(Map<String, dynamic> map) {
    return ResourceTypesModel(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceTypesModel.fromJson(String source) =>
      ResourceTypesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResourceTypesModel(name: $name, id: $id)';

  @override
  bool operator ==(covariant ResourceTypesModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
