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

  factory BonusInfo.fromJson(Map<String, dynamic> json) {
    return BonusInfo(
        quantityAll: json['quantity_all'],
        quantityReal: json['quantity_real'],
        quantityExpired: json['quantity_expired'],
        nextExpiredDate: json['next_expired_date'],
        loyaltyStatus: LoyaltyStatus.fromJsonMap(json['loyalty_category'])
    );
  }


}