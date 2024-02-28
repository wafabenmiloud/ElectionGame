// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';
class PersonModel {
  final int? id;
  final int country_id;
  final int? job_id;
  final int? political_party_id;
  final int age;
  final String first_name;
  final String last_name;
  final String birth_date;
  final String? ideology;
  final int political_direction;
  final String image_path;
  final int? like_me_percent;
  
  PersonModel({
    required this.country_id,
     this.id,
     this.job_id,
     required this.political_party_id,
    required this.age,
    required this.first_name,
    required this.last_name,
    required this.birth_date,
     this.ideology,
    required this.political_direction,
    required this.image_path,
     this.like_me_percent,
  });

  PersonModel copyWith({
    int? country_id,
    int? job_id,
    int? id,
    int? political_party_id,
    int? age,
    int? like_me_percent,
    String? first_name,
    String? last_name,
    String? birth_date,
    String? ideology,
    int? political_direction,
    String? image_path,
  }) {
    return PersonModel(
      id: id ?? this.id,
      country_id: country_id ?? this.country_id,
      job_id: job_id ?? this.job_id,
      political_party_id: political_party_id ?? this.political_party_id,
      age: age ?? this.age,
      like_me_percent: like_me_percent ?? this.like_me_percent,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      birth_date: birth_date ?? this.birth_date,
      ideology: ideology ?? this.ideology,
      political_direction: political_direction ?? this.political_direction,
      image_path: image_path ?? this.image_path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_id': country_id,
      'job_id': job_id,
      'political_party_id': political_party_id,
      'age': age,
      'like_me_percent': like_me_percent,
      'first_name': first_name,
      'last_name': last_name,
      'birth_date': birth_date,
      'ideology': ideology,
      'political_direction': political_direction,
      'image_path': image_path,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] as int,
      country_id: map['country_id'] as int,
      job_id: map['job_id'] as int?,
      political_party_id: map['political_party_id'] as int?,
      age: map['age'] as int,
      like_me_percent: map['like_me_percent'] as int?,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      birth_date: map['birth_date'] as String,
      ideology: map['ideology'] as String?,
      political_direction: map['political_direction'] as int,
      image_path: map['image_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PersonModel(id:$id,country_id: $country_id,job_id: $job_id,political_party_id: $political_party_id,age: $age,like_me_percent: $like_me_percent,first_name: $first_name,last_name: $last_name,birth_date: $birth_date,ideology: $ideology,political_direction: $political_direction,image_path: $image_path)';

  @override
  bool operator ==(covariant PersonModel other) {
    if (identical(this, other)) return true;

    return
        other.id == id &&
        other.country_id == country_id &&
        other.job_id == job_id &&
        other.political_party_id == political_party_id &&
        other.age == age &&
        other.like_me_percent == like_me_percent &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.birth_date == birth_date &&
        other.ideology == ideology &&
        other.political_direction == political_direction &&
        other.image_path == image_path;
  }

  @override
  int get hashCode =>
      id.hashCode ^ 
      country_id.hashCode ^ 
      job_id.hashCode ^ 
      political_party_id.hashCode ^ 
      age.hashCode ^ 
      like_me_percent.hashCode ^ 
      first_name.hashCode ^ 
      last_name.hashCode ^ 
      birth_date.hashCode ^ 
      ideology.hashCode ^ 
      political_direction.hashCode ^ 
      image_path.hashCode;
}
