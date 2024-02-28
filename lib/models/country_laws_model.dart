import 'dart:convert';

class CountryLawsModel {
  final int id;
  final String name;
  final int political_direction;
  final int minister_id;
  final String description;
  final String value_type;
  final String? show_format;
  final int value_min;
  final int value_max;
  final int value_per_slice;
  final int default_value;
  final int add_value_political_direction_per_slice;
  final int number_changed_slice;
  final int points_per_slice;

  CountryLawsModel({
    required this.id,
    required this.name,
    required this.political_direction,
    required this.minister_id,
    required this.description,
    required this.value_type,
    required this.value_min,
    required this.value_max,
    required this.value_per_slice,
    required this.default_value,
    required this.add_value_political_direction_per_slice,
    required this.points_per_slice,
    required this.number_changed_slice,
    required this.show_format
  });

  CountryLawsModel copyWith({
    int? id,
    String? name,
    int? political_direction,
    int? minister_id,
    String? description,
    String? value_type,
    String? show_format,
    int? value_min,
    int? value_max,
    int? value_per_slice,
    int? default_value,
    int? add_value_political_direction_per_slice,
    int? points_per_slice,
    int? number_changed_slice,
  }) {
    return CountryLawsModel(
      id: id ?? this.id,
      show_format: show_format ?? this.show_format,
      name: name ?? this.name,
      political_direction: political_direction ?? this.political_direction,
      minister_id: minister_id ?? this.minister_id,
      description: description ?? this.description,
      value_type: value_type ?? this.value_type,
      value_min: value_min ?? this.value_min,
      value_max: value_max ?? this.value_max,
      value_per_slice: value_per_slice ?? this.value_per_slice,
      default_value: default_value ?? this.default_value,
      add_value_political_direction_per_slice:
          add_value_political_direction_per_slice ??
              this.add_value_political_direction_per_slice,
      points_per_slice: points_per_slice ?? this.points_per_slice,
      number_changed_slice: number_changed_slice ?? this.number_changed_slice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'show_format': show_format,
      'political_direction': political_direction,
      'minister_id': minister_id,
      'description': description,
      'value_type': value_type,
      'value_min': value_min,
      'value_max': value_max,
      'value_per_slice': value_per_slice,
      'default_value': default_value,
      'add_value_political_direction_per_slice':
          add_value_political_direction_per_slice,
      'points_per_slice': points_per_slice,
      'number_changed_slice': number_changed_slice,
    };
  }

  factory CountryLawsModel.fromMap(Map<String, dynamic> map) {
    return CountryLawsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      show_format: map['show_format'] as String?,
      political_direction: map['political_direction'] as int,
      minister_id: map['minister_id'] as int,
      description: map['description'] as String,
      value_type: map['value_type'] as String,
      value_min: map['value_min'] as int,
      value_max: map['value_max'] as int,
      value_per_slice: map['value_per_slice'] as int,
      default_value: map['default_value'] as int,
      add_value_political_direction_per_slice:
          map['add_value_political_direction_per_slice'] as int,
      points_per_slice: map['points_per_slice'] as int,
      number_changed_slice: map['number_changed_slice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryLawsModel.fromJson(String source) =>
      CountryLawsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CountryLawsModel( id: $id,name: $name,show_format:$show_format,political_direction: $political_direction,minister_id: $minister_id,description: $description,value_type: $value_type,value_min: $value_min,value_max: $value_max,value_per_slice: $value_per_slice,default_value: $default_value,add_value_political_direction_per_slice:    $add_value_political_direction_per_slice,number_changed_slice: $number_changed_slice,points_per_slice: $points_per_slice)';

  @override
  bool operator ==(covariant CountryLawsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.show_format == show_format &&
        other.political_direction == political_direction &&
        other.minister_id == minister_id &&
        other.description == description &&
        other.value_type == value_type &&
        other.value_min == value_min &&
        other.value_max == value_max &&
        other.value_per_slice == value_per_slice &&
        other.default_value == default_value &&
        other.add_value_political_direction_per_slice ==
            add_value_political_direction_per_slice &&
        other.points_per_slice == points_per_slice &&
        other.number_changed_slice == number_changed_slice;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      show_format.hashCode ^
      political_direction.hashCode ^
      minister_id.hashCode ^
      description.hashCode ^
      value_type.hashCode ^
      value_min.hashCode ^
      value_max.hashCode ^
      value_per_slice.hashCode ^
      default_value.hashCode ^
      add_value_political_direction_per_slice.hashCode ^
      number_changed_slice.hashCode ^
      points_per_slice.hashCode;
}
