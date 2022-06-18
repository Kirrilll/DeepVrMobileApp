import 'dart:convert';

import 'package:deepvr/data/entities/user_info.dart';


class AuthenticationResponse {
  int? error;
  String? token;
  String? message;
  UserInfo? userInfo;

  AuthenticationResponse({required this.error, required this.token, this.message, this.userInfo});

  AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    token = json['token'];
    message = json['message'];
    userInfo = json['response'] != null
        ? UserInfo.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['token'] = token;
    data['message'] = message;
    data['user-info'] = userInfo?.toJson();
    return data;
  }

  factory AuthenticationResponse.fromJsonString(String jsonValue){
    return AuthenticationResponse.fromJson(json.decode(jsonValue));
  }
}