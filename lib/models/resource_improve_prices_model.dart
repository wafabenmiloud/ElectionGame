// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'dart:convert';

class ResourceImprovePricesModel {
  final int id;
  final int level;
  final int price;
  final String name;
  ResourceImprovePricesModel({
    required this.id,
  
    required this.level,
    required this.price,
    required this.name,
  });

  ResourceImprovePricesModel copyWith({
    int? id,
   
    int? level,
    int? price,
    String? name,
  }) {
    return ResourceImprovePricesModel(
      id: id ?? this.id,
 
      level: level ?? this.level,
      price: price ?? this.price,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    
      'level': level,
      'price': price,
      'name': name,
    };
  }

  factory ResourceImprovePricesModel.fromMap(Map<String, dynamic> map) {
    return ResourceImprovePricesModel(
      id: map['id'] as int,
     
      level: map['level'] as int,
      price: map['price'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceImprovePricesModel.fromJson(String source) =>
      ResourceImprovePricesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResourceImprovePricesModel(id: $id,level: $level, price: $price, name: $name)';

  @override
  bool operator ==(covariant ResourceImprovePricesModel other) {
    if (identical(this, other)) return true;

    return 
    other.id == id && 
   
    other.level == level && 
    other.price == price && 
    other.name == name;
  }

  @override
  int get hashCode => 
  id.hashCode ^ 
 
  level.hashCode ^ 
  price.hashCode ^ 
  name.hashCode;
}
