import 'dart:convert';

class StoredData{
  String userName;
  String token;

  StoredData({required this.token, required this.userName});

  String toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['token'] = token;
    return json.encode(data);
  }

  factory StoredData.fromJson(String str) {
    final jsonMap = json.decode(str);
    return StoredData(token: jsonMap['token'], userName: jsonMap['user_name']);
  }
}