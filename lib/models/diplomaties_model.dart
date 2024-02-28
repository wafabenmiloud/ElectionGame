// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class DiplomatiesModel {
  final int? id;
  final int? country_id;
  final int? country_2_id;
  final String? embassy_status;
  final String? visa_status;
  final String? military_status;
  final String? commercial_status;
  DiplomatiesModel({
    required this.id,
    required this.country_id,
    required this.country_2_id,
    required this.embassy_status,
    required this.visa_status,
    required this.military_status,
    required this.commercial_status,
  });

  DiplomatiesModel copyWith({
    int? id,
    int? country_id,
    int? country_2_id,
    String? embassy_status,
    String? visa_status,
    String? military_status,
    String? commercial_status,
  }) {
    return DiplomatiesModel(
      id: id ?? this.id,
      country_2_id: country_2_id ?? this.country_2_id,
      country_id: country_id ?? this.country_id,
      embassy_status: embassy_status ?? this.embassy_status,
      visa_status: visa_status ?? this.visa_status,
      military_status: military_status ?? this.military_status,
      commercial_status: commercial_status ?? this.commercial_status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_id': country_id,
      'country_2_id': country_2_id,
      'embassy_status': embassy_status,
      'visa_status': visa_status,
      'military_status': military_status,
      'commercial_status': commercial_status,
    };
  }

  factory DiplomatiesModel.fromMap(Map<String, dynamic> map) {
    return DiplomatiesModel(
      id: map['id'] as int,
      country_id: map['country_id'] as int,
      country_2_id: map['country_2_id'] as int,
      embassy_status: map['embassy_status'] as String,
      visa_status: map['visa_status'] as String,
      military_status: map['military_status'] as String,
      commercial_status: map['commercial_status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiplomatiesModel.fromJson(String source) =>
      DiplomatiesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DiplomatiesModel(id: $id,  country_id: $country_id, country_2_id:$country_2_id,     embassy_status: $embassy_status,visa_status: $visa_status,      military_status: $military_status,      commercial_status: $commercial_status,)';

  @override
  bool operator ==(covariant DiplomatiesModel other) {
    if (identical(this, other)) return true;

    return other.id == id 
    && other.country_id == country_id
    && other.country_2_id == country_2_id
    && other.embassy_status == embassy_status
    && other.visa_status == visa_status
    && other.military_status == military_status
    && other.commercial_status == commercial_status
    
    
    ;
  }

  @override
  int get hashCode => id.hashCode
   ^ country_id.hashCode
   ^ country_2_id.hashCode
   ^ embassy_status.hashCode
   ^ visa_status.hashCode
   ^ military_status.hashCode
   ^ commercial_status.hashCode
   ;
}
