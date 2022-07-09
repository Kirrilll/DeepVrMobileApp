import 'dart:convert';
import 'package:deepvr/data/entities/loyalty_status.dart';

class BonusInfo{
  int quantityAll;
  int quantityReal;
  int quantityExpired;
  String? nextExpiredDate;
  LoyaltyStatus loyaltyStatus;

  BonusInfo(
      {
        required this.quantityAll,
        required this.quantityReal,
        required this.quantityExpired,
        this.nextExpiredDate,
        required this.loyaltyStatus
      });

  factory BonusInfo.fromJson(String jsonSource) {

    Map<String, dynamic> jsonMap = json.decode(jsonSource);
    return BonusInfo(
        quantityAll: jsonMap['quantity_all'],
        quantityReal: jsonMap['quantity_real'],
        quantityExpired: jsonMap['quantity_expired'],
        nextExpiredDate: jsonMap['next_expired_date'],
        loyaltyStatus: LoyaltyStatus.fromJsonMap(jsonMap['loyalty_category'])
    );
  }


}