// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ResourceLicencesModel {
  final int? id;  
  final int? resource_id;
  final String name;
  final int? country_id;
  final int? level;
  final int? price;

  ResourceLicencesModel(
      {required this.id,
      required this.name,
      required this.resource_id,
      required this.country_id,
      required this.level,
      required this.price,
     });

  ResourceLicencesModel copyWith(
      {int? id,
      int? resource_id,
      String? name,
      int? country_id,
      int? level,
      int? price,
      }) {
    return ResourceLicencesModel(
      id: id ?? this.id,
      resource_id: resource_id ?? this.resource_id,
      country_id: country_id ?? this.country_id,
      level: level ?? this.level,
      price: price ?? this.price,
      name: name ?? this.name,
     
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'resource_id': resource_id,
      'country_id': country_id,
      'level': level,
      'price': price,
      'name': name,
    
    };
  }

  factory ResourceLicencesModel.fromMap(Map<String, dynamic> map) {
    return ResourceLicencesModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : '',
      resource_id: map['resource_id'] != null ? map['resource_id'] as int : null,
      country_id: map['country_id'] != null
          ? map['country_id'] as int
          : null,
      level:
          map['level'] != null ? map['level'] as int : null,
     price:
          map['price'] != null ? map['price'] as int : null,
  
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceLicencesModel.fromJson(String source) =>
      ResourceLicencesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceLicencesModel(id: $id,resource_id: $resource_id,country_id:$country_id,country_id:$level,price: $price)';
  }

  @override
  bool operator ==(covariant ResourceLicencesModel other) {
    if (identical(this, other)) return true;

    return 
        other.id == id &&
        other.resource_id == resource_id &&
        other.country_id == country_id &&
        other.level == level &&
        other.price == price &&
       
        other.name == name;
  }

  @override
  int get hashCode {
    return 
        id.hashCode ^
        resource_id.hashCode ^
        country_id.hashCode ^
        level.hashCode ^
        price.hashCode ^
        name.hashCode;
  }
}
