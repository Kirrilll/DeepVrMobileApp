import 'package:deepvr/data/entities/profile.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/v2/';

  Future<void> me(String name) async {
    var url = Uri.parse(_apiUrl + 'profile/get');
    var response = await _client.post(url);
  }

  Future<void> setProfile(Profile profile) async {
    var url = Uri.parse(_apiUrl + 'profile/set');
    var response = await _client.post(url, body: profile.toJson());
    print(response.body);
  }

}