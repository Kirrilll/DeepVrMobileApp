import 'dart:convert';

class DefaultResponse<T extends Object> {
  int? error;
  String? token;
  String? message;
  T? response;


  DefaultResponse({required this.error, required this.token, this.message, this.response});

  DefaultResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic> json) factory) {

    //print(json);
    error = json['error'];
    token = json['token'];
    message = json['message'];
    response = json['response'] != null
        ? factory(json['response'])
        : null;
  }


  factory DefaultResponse.fromJsonString(String jsonValue, T Function(Map<String, dynamic> json) factory){
    return DefaultResponse.fromJson(json.decode(jsonValue), factory);
  }
}