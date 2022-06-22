import 'dart:convert';

class SecuredData{
  String? token;
  String? name;

  SecuredData({this.name, this.token});

  String toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    return json.encode(data);
  }

  SecuredData.fromJson(Map<String, dynamic> json){
    name = json['name'];
    token = json['token'];
  }

  // factory SecuredData.

}