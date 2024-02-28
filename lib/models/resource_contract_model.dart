// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ResourceContractModel {
  final int? id;  
  final int? resource_id;
  final String date;
  final int? resource_type_id;
  final int? seller_country_id;
  final int? buyer_country_id;
  final int? price;
  final int? total_quantity;
  final int? unit_price;
  final int? mondial_unit_price;
  final int? difference_percent;
  ResourceContractModel(
      {required this.id,
      required this.date,
      required this.resource_id,
      required this.resource_type_id,
      required this.seller_country_id,
      required this.buyer_country_id,
      required this.price,
      required this.total_quantity,
      required this.unit_price,
      required this.mondial_unit_price,
      required this.difference_percent,
     });

  ResourceContractModel copyWith(
      {int? id,
      int? resource_id,
      String? date,
      int? resource_type_id,
      int? seller_country_id,
      int? buyer_country_id,
      int? price,
      int? total_quantity,
      int? unit_price,
      int? mondial_unit_price,
      int? difference_percent,
      }) {
    return ResourceContractModel(
      id: id ?? this.id,
      resource_id: resource_id ?? this.resource_id,
      resource_type_id: resource_type_id ?? this.resource_type_id,
      seller_country_id: seller_country_id ?? this.seller_country_id,
      buyer_country_id: buyer_country_id ?? this.buyer_country_id,
      price: price ?? this.price,
      date: date ?? this.date,
      total_quantity: total_quantity ?? this.total_quantity,
      unit_price: unit_price ?? this.unit_price,
      mondial_unit_price: mondial_unit_price ?? this.mondial_unit_price,
      difference_percent: difference_percent ?? this.difference_percent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'resource_id': resource_id,
      'resource_type_id': resource_type_id,
      'seller_country_id': seller_country_id,
      'buyer_country_id': buyer_country_id,
      'price': price,
      'date': date,
      'total_quantity': total_quantity,
      'unit_price': unit_price,
      'mondial_unit_price': mondial_unit_price,
      'difference_percent': difference_percent,
    };
  }

  factory ResourceContractModel.fromMap(Map<String, dynamic> map) {
    return ResourceContractModel(
      id: map['id'] != null ? map['id'] as int : null,
      date: map['date'] != null ? map['date'] as String : '',
      resource_id: map['resource_id'] != null ? map['resource_id'] as int : null,
      resource_type_id: map['resource_type_id'] != null
          ? map['resource_type_id'] as int
          : null,
      seller_country_id:
          map['seller_country_id'] != null ? map['seller_country_id'] as int : null,
      buyer_country_id:
          map['buyer_country_id'] != null ? map['buyer_country_id'] as int : null,
      price:
          map['price'] != null ? map['price'] as int : null,
    total_quantity: map['total_quantity'] != null
          ? map['total_quantity'] as int
          : null,
      unit_price: map['unit_price'] != null
          ? map['unit_price'] as int
          : null,
      mondial_unit_price: map['mondial_unit_price'] != null
          ? map['mondial_unit_price'] as int
          : null,
      difference_percent: map['difference_percent'] != null
          ? map['difference_percent'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceContractModel.fromJson(String source) =>
      ResourceContractModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceContractModel(id: $id,resource_id: $resource_id,difference_percent:$difference_percent,mondial_unit_price:$mondial_unit_price,resource_type_id:$resource_type_id,resource_type_id:$seller_country_id, buyer_country_id: $buyer_country_id,price: $price,total_quantity: $total_quantity,unit_price: $unit_price)';
  }

  @override
  bool operator ==(covariant ResourceContractModel other) {
    if (identical(this, other)) return true;

    return 
        other.id == id &&
        other.resource_id == resource_id &&
        other.resource_type_id == resource_type_id &&
        other.seller_country_id == seller_country_id &&
        other.buyer_country_id == buyer_country_id &&
        other.price == price &&
        other.total_quantity == total_quantity &&
        other.unit_price == unit_price &&
        other.mondial_unit_price == mondial_unit_price &&
        other.difference_percent == difference_percent &&
        other.date == date;
  }

  @override
  int get hashCode {
    return 
        id.hashCode ^
        resource_id.hashCode ^
        resource_type_id.hashCode ^
        seller_country_id.hashCode ^
        buyer_country_id.hashCode ^
        price.hashCode ^
        date.hashCode ^
        total_quantity.hashCode ^
        mondial_unit_price.hashCode ^
        difference_percent.hashCode ^
        unit_price.hashCode;
  }
}
