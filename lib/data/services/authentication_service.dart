import 'package:deepvr/data/entities/authentication_response.dart';
import 'package:deepvr/data/entities/login.dart';
import 'package:deepvr/data/entities/registration.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {

  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/v2/auth/';

  Future<AuthenticationResponse?> login(Login login) async {
    var uri = Uri.parse(_apiUrl + 'login');
    var response = await _client.post(uri, body: login.toJson());
    print(response.body);
    if(response.statusCode == 200) return AuthenticationResponse.fromJsonString(response.body);
    return null;
  }

  Future<AuthenticationResponse?> registration(Registration registration) async{
    var uri = Uri.parse(_apiUrl + 'registration');
    var response = await _client.post(uri, body: registration.toJson());
    if(response.statusCode == 200) return AuthenticationResponse.fromJsonString(response.body);
    return null;
  }

  Future<void> logout(String token) async {
    var uri = Uri.parse(_apiUrl + 'logout');
    await _client.post(uri, body: token);
  }



}