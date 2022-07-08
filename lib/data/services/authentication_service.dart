import 'package:deepvr/data/entities/default_response.dart';
import 'package:deepvr/data/entities/login.dart';
import 'package:deepvr/data/entities/registration.dart';
import 'package:deepvr/data/entities/user_info.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {

  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/v2/auth/';

  Future<DefaultResponse<UserInfo>?> login(Login login) async {
    var uri = Uri.parse(_apiUrl + 'login');
    var response = await _client.post(uri, body: login.toJson());
    if(response.statusCode == 200) return DefaultResponse.fromJsonString(response.body, UserInfo.fromJson);
    return null;
  }

  Future<DefaultResponse<UserInfo>?> registration(Registration registration) async{
    var uri = Uri.parse(_apiUrl + 'registration');
    var response = await _client.post(uri, body: registration.toJson());
    if(response.statusCode == 200) return DefaultResponse.fromJsonString(response.body, UserInfo.fromJson);
    return null;
  }

  Future<void> logout(String token) async {
    var uri = Uri.parse(_apiUrl + 'logout');
    await _client.post(uri, body: token);
  }



}