import 'dart:convert';

class Request {
  int? error;
  String? errorText;

  Request({this.error, this.errorText});

  Request.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorText = json['error_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['error_text'] = errorText;
    return data;
  }

  factory Request.requestFromJson(String jsonStr){
    return Request.fromJson(json.decode(jsonStr));
  }
}