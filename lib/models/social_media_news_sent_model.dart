// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_sent_datetimes
import 'dart:convert';

class SocialMediaNewsSentModel {
  final int? id;  
  final int? social_media_news_id;
  final String sent_datetime;
  final int? country_id;
 

  SocialMediaNewsSentModel(
      {required this.id,
      required this.sent_datetime,
      required this.social_media_news_id,
      required this.country_id,
     
     });

  SocialMediaNewsSentModel copyWith(
      {int? id,
      int? social_media_news_id,
      String? sent_datetime,
      int? country_id,
     
      }) {
    return SocialMediaNewsSentModel(
      id: id ?? this.id,
      social_media_news_id: social_media_news_id ?? this.social_media_news_id,
      country_id: country_id ?? this.country_id,
   
      sent_datetime: sent_datetime ?? this.sent_datetime,
     
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'social_media_news_id': social_media_news_id,
      'country_id': country_id,
    
      'sent_datetime': sent_datetime,
    
    };
  }

  factory SocialMediaNewsSentModel.fromMap(Map<String, dynamic> map) {
    return SocialMediaNewsSentModel(
      id: map['id'] != null ? map['id'] as int : null,
      sent_datetime: map['sent_datetime'] != null ? map['sent_datetime'] as String : '',
      social_media_news_id: map['social_media_news_id'] != null ? map['social_media_news_id'] as int : null,
      country_id: map['country_id'] != null
          ? map['country_id'] as int
          : null,
   
  
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMediaNewsSentModel.fromJson(String source) =>
      SocialMediaNewsSentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialMediaNewsSentModel(id: $id,social_media_news_id: $social_media_news_id,country_id:$country_id,sent_datetime: $sent_datetime)';
  }

  @override
  bool operator ==(covariant SocialMediaNewsSentModel other) {
    if (identical(this, other)) return true;

    return 
        other.id == id &&
        other.social_media_news_id == social_media_news_id &&
        other.country_id == country_id &&
      
       
        other.sent_datetime == sent_datetime;
  }

  @override
  int get hashCode {
    return 
        id.hashCode ^
        social_media_news_id.hashCode ^
        country_id.hashCode ^
     
        sent_datetime.hashCode;
  }
}
