import 'dart:convert';

class LoyaltyStatus{
  int id;
  String title;
  int cashback;
  int entryCondition;
  int amountDiscountMax;

  LoyaltyStatus(
      {required this.id,
        required this.title,
        required this.cashback,
        required this.entryCondition,
        required this.amountDiscountMax});

  factory LoyaltyStatus.fromJsonMap(Map<String, dynamic> json) => LoyaltyStatus(
      id: json['id'],
      title: json['title'],
      cashback: json['cashback'],
      entryCondition: json['entry_condition'],
      amountDiscountMax: json['amount_discount_max']
  );

  factory LoyaltyStatus.fromJson(String jsonStr) {
    Map<String, dynamic> jsonMap =  json.decode(jsonStr);
    return LoyaltyStatus(
        id: jsonMap['id'],
        title: jsonMap['title'],
        cashback: jsonMap['cashback'],
        entryCondition: jsonMap['entry_condition'],
        amountDiscountMax: jsonMap['amount_discount_max']
    );
  }

  static List<LoyaltyStatus> listFromJson(String jsonSource){
    return List<LoyaltyStatus>.from(json.decode(jsonSource).map((x) => LoyaltyStatus.fromJsonMap(x)));
  }

}