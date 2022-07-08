import 'dart:convert';

class UserInfo{
  String telephone;
  String email;
  String name;

  UserInfo({required this.telephone, required this.email, required this.name});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(telephone: json['telephone'], email: json['email'], name: json['name']);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telephone'] = telephone;
    data['email'] = email;
    data['name'] = name;
    return data;
  }

}