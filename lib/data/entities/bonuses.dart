import 'dart:convert';

class Bonuses {
  int? quantityAll;
  int? quantityReal;
  int? quantityExpired;
  String? nextExpiredDate;

  Bonuses(
      {this.quantityAll,
        this.quantityReal,
        this.quantityExpired,
        this.nextExpiredDate});

  Bonuses.fromJson(Map<String, dynamic> json) {
    quantityAll = json['quantity_all'];
    quantityReal = json['quantity_real'];
    quantityExpired = json['quantity_expired'];
    nextExpiredDate = json['next_expired_date'];
  }

  static Bonuses fromJsonStr(String str){
   return Bonuses.fromJson(json.decode(str));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity_all'] = quantityAll;
    data['quantity_real'] = quantityReal;
    data['quantity_expired'] = quantityExpired;
    data['next_expired_date'] = nextExpiredDate;
    return data;
  }
}