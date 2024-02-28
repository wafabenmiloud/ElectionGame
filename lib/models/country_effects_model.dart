// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CountryEffectsModel {
  final int id;
  final int item_id;
  final int country_effects_init_id;
  final num per_round_change;
  final String per_round_type;
  final String item_type;
  CountryEffectsModel({
    required this.id,
    required this.item_id,
    required this.country_effects_init_id,
    required this.per_round_change,
    required this.per_round_type,
    required this.item_type,
  });

  CountryEffectsModel copyWith({
    int? id,
    int? item_id,
    int? country_effects_init_id,
    num? per_round_change,
    String? per_round_type,
    String? item_type,
  }) {
    return CountryEffectsModel(
      id: id ?? this.id,
      item_id: item_id ?? this.item_id,
      country_effects_init_id: country_effects_init_id ?? this.country_effects_init_id,
      per_round_change: per_round_change ?? this.per_round_change,
      per_round_type: per_round_type ?? this.per_round_type,
      item_type: item_type ?? this.item_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'item_id': item_id,
      'country_effects_init_id': country_effects_init_id,
      'per_round_change': per_round_change,
      'per_round_type': per_round_type,
      'item_type': item_type,
    };
  }

  factory CountryEffectsModel.fromMap(Map<String, dynamic> map) {
    return CountryEffectsModel(
      id: map['id'] as int,
      item_id: map['item_id'] as int,
      country_effects_init_id: map['country_effects_init_id'] as int,
      per_round_change: map['per_round_change'] as num,
      per_round_type: map['per_round_type'] as String,
      item_type: map['item_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryEffectsModel.fromJson(String source) =>
      CountryEffectsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CountryEffectsModel(id: $id, item_id: $item_id,country_effects_init_id:$country_effects_init_id,      per_round_change: $per_round_change,      per_round_type: $per_round_type,      item_type: $item_type,)';

  @override
  bool operator ==(covariant CountryEffectsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.item_id == item_id &&
        other.country_effects_init_id == country_effects_init_id &&
        other.per_round_change == per_round_change &&
        other.per_round_type == per_round_type &&
        other.item_type == item_type;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      item_id.hashCode ^
      country_effects_init_id.hashCode ^
      per_round_change.hashCode ^
      per_round_type.hashCode ^
      item_type.hashCode;
}
