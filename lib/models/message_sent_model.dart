import 'dart:convert';

class MessageSentModel {
  final int id;
  final int message_id;
  final int sender_country_id;
  final int sender_person_id;
  final int recipient_country_id;
  final int is_opened;
  final int response_id;
  final String title;
  final String content;
  final String date;
  final String response_date;
  MessageSentModel({
    required this.id,
    required this.message_id,
    required this.sender_country_id,
    required this.sender_person_id,
    required this.recipient_country_id,
    required this.is_opened,
    required this.response_id,
    required this.title,
    required this.content,
    required this.date,
    required this.response_date,
  });

  MessageSentModel copyWith({
    int? id,
    int? message_id,
    int? sender_country_id,
    int? sender_person_id,
    int? recipient_country_id,
    int? is_opened,
    int? response_id,
    String? title,
    String? content,
    String? date,
    String? response_date,
  }) {
    return MessageSentModel(
      id: id ?? this.id,
      message_id: message_id ?? this.message_id,
      sender_country_id: sender_country_id ?? this.sender_country_id,
      sender_person_id: sender_person_id ?? this.sender_person_id,
      recipient_country_id: recipient_country_id ?? this.recipient_country_id,
      is_opened: is_opened ?? this.is_opened,
      response_id: response_id ?? this.response_id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      response_date: response_date ?? this.response_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message_id': message_id,
      'sender_country_id': sender_country_id,
      'sender_person_id': sender_person_id,
      'recipient_country_id': recipient_country_id,
      'is_opened': is_opened,
      'response_id': response_id,
      
      'date': date,
      'response_date': response_date,
      'title': title,
      'content': content,
    };
  }

  factory MessageSentModel.fromMap(Map<String, dynamic> map) {
    return MessageSentModel(
      id: map['id'] as int,
      message_id: map['message_id'] as int,
      sender_country_id: map['sender_country_id'] as int,
      sender_person_id: map['sender_person_id'] as int,
      recipient_country_id: map['recipient_country_id'] as int,
      is_opened: map['is_opened'] as int,
      response_id: map['response_id'] as int,
      date: map['date'] as String,
      response_date: map['response_date'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageSentModel.fromJson(String source) =>
      MessageSentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MessageSentModel( id: $id,title: $title,content: $content,message_id: $message_id,  sender_country_id: $sender_country_id,sender_person_id: $sender_person_id,recipient_country_id: $recipient_country_id, is_opened: $is_opened, response_id: $response_id, date: $date,response_date: $response_date,)';

  @override
  bool operator ==(covariant MessageSentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.message_id == message_id &&
        other.sender_country_id == sender_country_id &&
        other.sender_country_id == sender_country_id &&
        other.recipient_country_id == recipient_country_id &&
        other.is_opened == is_opened &&
        other.response_id == response_id &&
        other.title == title &&
        other.content == content &&
        other.message_id == message_id;
  }

  @override
  int get hashCode =>
      id.hashCode ^ 
      message_id.hashCode ^ 
      title.hashCode ^ 
      sender_country_id.hashCode ^ 
      sender_person_id.hashCode ^ 
      recipient_country_id.hashCode ^ 
      is_opened.hashCode ^ 
      response_id.hashCode ^ 
      date.hashCode ^ 
      response_date.hashCode ^ 
      content.hashCode;
}
