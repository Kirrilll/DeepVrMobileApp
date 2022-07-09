import 'dart:convert';

class UserInfo{
  String telephone;
  String email;
  String name;

  UserInfo({required this.telephone, required this.email, required this.name});

  factory UserInfo.fromJson(String jsonSource) {
    Map<String, dynamic> jsonMap = json.decode(jsonSource);
    return UserInfo(telephone: jsonMap['telephone'], email: jsonMap['email'], name: jsonMap['name']);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telephone'] = telephone;
    data['email'] = email;
    data['name'] = name;
    return data;
  }

}