// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CurrentGameModel {
  final int? id;
  final String country_name;
  final int country_id;
  final int? me_id;
  final int points;
  final String current_date;
  final String birth_date;
  final String my_name;
  final String first_name;
  final String last_name;
  final int gender;
  final String start_date;
  final String end_mandat;
  final String country_flag_img_path;
  final String president_image_path;

  CurrentGameModel({
    required this.country_name,
    required this.country_id,
     this.me_id,
     this.id,
    required this.points,
    required this.current_date,
    required this.birth_date,
    required this.my_name,
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.start_date,
    required this.end_mandat,
    required this.country_flag_img_path,
    required this.president_image_path,
  });

  CurrentGameModel copyWith({
    int? id,
    String? country_name,
    int? country_id,
    int? me_id,
    int? points,
    String? current_date,
    String? birth_date,
    String? my_name,
    String? first_name,
    String? last_name,
    int? gender,
    String? start_date,
    String? end_mandat,
    String? country_flag_img_path,
    String? president_image_path,
  }) {
    return CurrentGameModel(
      id: id ?? this.id,
      country_name: country_name ?? this.country_name,
      country_id: country_id ?? this.country_id,
      me_id: me_id ?? this.me_id,
      points: points ?? this.points,
      current_date: current_date ?? this.current_date,
      birth_date: birth_date ?? this.birth_date,
      my_name: my_name ?? this.my_name,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      gender: gender ?? this.gender,
      start_date: start_date ?? this.start_date,
      end_mandat: end_mandat ?? this.end_mandat,
      country_flag_img_path:
          country_flag_img_path ?? this.country_flag_img_path,
      president_image_path: president_image_path ?? this.president_image_path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country_name': country_name,
      'country_id': country_id,
      'me_id': me_id,
      'points': points,
      'current_date': current_date,
      'birth_date': birth_date,
      'my_name': my_name,
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'start_date': start_date,
      'end_mandat': end_mandat,
      'country_flag_img_path': country_flag_img_path,
      'president_image_path': president_image_path,
    };
  }

  factory CurrentGameModel.fromMap(Map<String, dynamic> map) {
    return CurrentGameModel(
      country_name: map['country_name'] as String,
      country_id: map['country_id'] as int,
      id: map['id'] as int,
      me_id: map['me_id'] as int,
      points: map['points'] as int,
      current_date: map['current_date'] as String,
      birth_date: map['birth_date'] as String,
      my_name: map['my_name'] as String,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      gender: map['gender'] as int,
      start_date: map['start_date'] as String,
      end_mandat: map['end_mandat'] as String,
      country_flag_img_path: map['country_flag_img_path'] as String,
      president_image_path: map['president_image_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentGameModel.fromJson(String source) =>
      CurrentGameModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentGameModel(me_id:$me_id,country_name: $country_name, country_id: $country_id, points: $points, current_date: $current_date,birth_date: $birth_date,my_name : $my_name, first_name: $first_name, last_name: $last_name, gender: $gender, start_date: $start_date, end_mandat: $end_mandat, country_flag_img_path: $country_flag_img_path, president_image_path: $president_image_path )';
  }

  @override
  bool operator ==(covariant CurrentGameModel other) {
    if (identical(this, other)) return true;

    return other.country_name == country_name &&
        other.country_id == country_id &&
        other.me_id == me_id &&
        other.points == points &&
        other.current_date == current_date &&
        other.birth_date == birth_date &&
        other.my_name == my_name &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.gender == gender &&
        other.start_date == start_date &&
        other.end_mandat == end_mandat &&
        other.president_image_path == president_image_path &&
        other.country_flag_img_path == country_flag_img_path;
  }

  @override
  int get hashCode {
    return country_name.hashCode ^
        country_id.hashCode ^
        me_id.hashCode ^
        points.hashCode ^
        current_date.hashCode ^
        start_date.hashCode ^
        end_mandat.hashCode ^
        birth_date.hashCode ^
        my_name.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        gender.hashCode ^
        president_image_path.hashCode ^
        country_flag_img_path.hashCode;
  }
}
