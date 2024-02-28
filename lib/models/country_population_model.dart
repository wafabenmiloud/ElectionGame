// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CountryPopulationModel {
  final int? id;
  final int? percent;
  final int? quantity_per_person;

  final String? attribute_type_label;
  final String? attribute_value_type;
  final String? attribute_type;
  final String? attribute_value;
  final String? age_category;
  final String? gender;

  CountryPopulationModel(
      {required this.id,
      required this.attribute_type_label,
      required this.attribute_value_type,
      required this.quantity_per_person,
      required this.attribute_type,
      required this.attribute_value,
      required this.age_category,
      required this.gender,
      required this.percent,
     
    });

  CountryPopulationModel copyWith(
      {int? id,
      String? attribute_type_label,
      String? attribute_value_type,
      int? quantity_per_person,
      String? attribute_type,
      String? attribute_value,
      String? age_category,
      String? gender,
      int? percent,
    
    }) {
    return CountryPopulationModel(
      id: id ?? this.id,
      attribute_type_label:
          attribute_type_label ?? this.attribute_type_label,
      attribute_value_type: attribute_value_type ?? this.attribute_value_type,
      quantity_per_person: quantity_per_person ?? this.quantity_per_person,
      attribute_type: attribute_type ?? this.attribute_type,
      attribute_value: attribute_value ?? this.attribute_value,
      age_category: age_category ?? this.age_category,
      gender: gender ?? this.gender,
      percent: percent ?? this.percent,
    
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attribute_type_label': attribute_type_label,
      'attribute_value_type': attribute_value_type,
      'quantity_per_person': quantity_per_person,
      'attribute_type': attribute_type,
      'attribute_value': attribute_value,
      'age_category': age_category,
      'gender': gender,
      'percent': percent,
    
    
    };
  }

  factory CountryPopulationModel.fromMap(Map<String, dynamic> map) {
    return CountryPopulationModel(
      id: map['id'] as int?,
      attribute_type_label: map['attribute_type_label'] as String?,
      attribute_value_type: map['attribute_value_type'] as String?,
      quantity_per_person: map['quantity_per_person'] as int?,
      attribute_type: map['attribute_type'] as String?,
      attribute_value: map['attribute_value'] as String?,
      age_category: map['age_category'] as String?,
      gender: map['gender'] as String?,
      percent: map['percent'] as int?,
    
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryPopulationModel.fromJson(String source) =>
      CountryPopulationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryPopulationModel(id: $id, attribute_type_label: $attribute_type_label, attribute_value_type: $attribute_value_type, quantity_per_person: $quantity_per_person, attribute_type: $attribute_type, attribute_value: $attribute_value, age_category: $age_category, gender :$gender,percent:$percent)';
  }

  @override
  bool operator ==(covariant CountryPopulationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.attribute_type_label == attribute_type_label &&
        other.attribute_value_type == attribute_value_type &&
        other.quantity_per_person == quantity_per_person &&
        other.attribute_type == attribute_type &&
        other.attribute_value == attribute_value &&
        other.age_category == age_category &&
        other.gender == gender &&
        other.percent == percent ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        attribute_type_label.hashCode ^
        attribute_value_type.hashCode ^
        quantity_per_person.hashCode ^
        attribute_type.hashCode ^
        attribute_value.hashCode ^
        age_category.hashCode ^
        gender.hashCode ^
        percent.hashCode ;
  }
}
