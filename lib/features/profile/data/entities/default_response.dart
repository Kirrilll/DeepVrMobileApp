import 'dart:convert';

class DefaultResponse<T extends Object> {
  int? error;
  String? token;
  String? message;
  T? response;


  DefaultResponse({required this.error, required this.token, this.message, this.response});

  DefaultResponse.fromJson(Map<String, dynamic> jsonMap, T Function(String json) factory) {
    error = jsonMap['error'];
    token = jsonMap['token'];
    message = jsonMap['message'];
    response = jsonMap['response'] != null
        ? factory(json.encode(jsonMap['response']))
        : null;
  }


  factory DefaultResponse.fromJsonString(String jsonValue, T Function(String json) factory){
    return DefaultResponse.fromJson(json.decode(jsonValue), factory);
  }
}