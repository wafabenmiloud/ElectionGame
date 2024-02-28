// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CountryDebtsModel {
  final int? id;
  final int? borrower_country_id;
  final String? lender_type;
  final int? lender_id;
  final int? total_amount;
  final int? total_refunded;
  final int? days_number;
  final int? days_remaining;
  final int? refund_amount_per_round;
  final int? is_finish;
  final int? is_granted;
  final String? start_date;
  final String? end_date;
  final String? debt_status;
  CountryDebtsModel({
    required this.id,
    required this.borrower_country_id,
    required this.lender_type,
    required this.lender_id,
    required this.total_amount,
    required this.total_refunded,
    required this.days_number,
    required this.days_remaining,
    required this.refund_amount_per_round,
    required this.is_finish,
    required this.is_granted,
    required this.start_date,
    required this.end_date,
    required this.debt_status,
  });

  CountryDebtsModel copyWith({
    int? id,
    int? borrower_country_id,
    String? lender_type,
    int? lender_id,
    int? total_amount,
    int? total_refunded,
    int? days_number,
    int? days_remaining,
    int? refund_amount_per_round,
    int? is_finish,
    int? is_granted,
    String? start_date,
    String? end_date,
    String? debt_status,
  }) {
    return CountryDebtsModel(
      id: id ?? this.id,
      borrower_country_id: borrower_country_id ?? this.borrower_country_id,
      lender_type: lender_type ?? this.lender_type,
      lender_id: lender_id ?? this.lender_id,
      total_amount: total_amount ?? this.total_amount,
      total_refunded: total_refunded ?? this.total_refunded,
      days_number: days_number ?? this.days_number,
      days_remaining: days_remaining ?? this.days_remaining,
      refund_amount_per_round:
          refund_amount_per_round ?? this.refund_amount_per_round,
      is_finish: is_finish ?? this.is_finish,
      is_granted: is_granted ?? this.is_granted,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      debt_status: debt_status ?? this.debt_status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'borrower_country_id': borrower_country_id,
      'lender_type': lender_type,
      'lender_id': lender_id,
      'total_amount': total_amount,
      'total_refunded': total_refunded,
      'days_number': days_number,
      'days_remaining': days_remaining,
      'refund_amount_per_round': refund_amount_per_round,
      'is_finish': is_finish,
      'is_granted': is_granted,
      'start_date': start_date,
      'end_date': end_date,
      'debt_status': debt_status,
    };
  }

  factory CountryDebtsModel.fromMap(Map<String, dynamic> map) {
    return CountryDebtsModel(
      id: map['id'] as int?,
      borrower_country_id: map['borrower_country_id'] as int?,
      lender_type: map['lender_type'] as String,
      lender_id: map['lender_id'] as int?,
      total_amount: map['total_amount'] as int?,
      total_refunded: map['total_refunded'] as int?,
      days_number: map['days_number'] as int?,
      days_remaining: map['days_remaining'] as int?,
      refund_amount_per_round: map['refund_amount_per_round'] as int?,
      is_finish: map['is_finish'] as int?,
      is_granted: map['is_granted'] as int?,
      start_date: map['start_date'] as String?,
      end_date: map['end_date'] as String?,
      debt_status: map['debt_status'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryDebtsModel.fromJson(String source) =>
      CountryDebtsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CountryDebtsModel(id: $id, borrower_country_id: $borrower_country_id, debt_status:$debt_status     lender_type: $lender_type,lender_id: $lender_id,      total_amount: $total_amount,      total_refunded: $total_refunded,      days_number: $days_number,      days_remaining: $days_remaining,      refund_amount_per_round: $refund_amount_per_round,is_finish: $is_finish,      is_granted: $is_granted,start_date: $start_date,      end_date: $end_date,)';

  @override
  bool operator ==(covariant CountryDebtsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.borrower_country_id == borrower_country_id &&
        other.lender_type == lender_type &&
        other.lender_id == lender_id &&
        other.total_amount == total_amount &&
        other.total_refunded == total_refunded &&
        other.days_number == days_number &&
        other.days_remaining == days_remaining &&
        other.refund_amount_per_round == refund_amount_per_round &&
        other.is_finish == is_finish &&
        other.is_granted == is_granted &&
        other.start_date == start_date &&
        other.debt_status == debt_status &&
        other.end_date == end_date;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      borrower_country_id.hashCode ^
      lender_type.hashCode ^
      lender_id.hashCode ^
      total_amount.hashCode ^
      total_refunded.hashCode ^
      days_number.hashCode ^
      days_remaining.hashCode ^
      refund_amount_per_round.hashCode ^
      is_finish.hashCode ^
      is_granted.hashCode ^
      start_date.hashCode ^
      debt_status.hashCode ^
      end_date.hashCode;
}
