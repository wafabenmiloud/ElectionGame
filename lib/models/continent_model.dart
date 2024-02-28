import 'dart:convert';

class ContinentModel {
  final String? name;
  final String? image;
  ContinentModel({
    required this.name,
    required this.image,
  });

  ContinentModel copyWith({
    String? name,
    String? image,
  }) {
    return ContinentModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory ContinentModel.fromMap(Map<String, dynamic> map) {
    return ContinentModel(
      name: map['name'] as String?,
      image: map['image'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContinentModel.fromJson(String source) =>
      ContinentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ContinentModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant ContinentModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
