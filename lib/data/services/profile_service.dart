import 'package:deepvr/data/entities/default_response.dart';
import 'package:deepvr/data/entities/user_info.dart';
import 'package:deepvr/domain/models/bonus.dart';
import 'package:http/http.dart' as http;

import '../entities/bonus_info.dart';

class ProfileService {
  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/v2/';
  Future<void> me(String name) async {
    var url = Uri.parse(_apiUrl + 'profile/get');
    var response = await _client.post(url);
  }

  Future<void> setProfile(String name, String token) async {
    var url = Uri.parse(_apiUrl + 'profile/set');
    var response = await _client.post(url, body: <String, dynamic>{
      'name': name,
      'token': token,
    });
  }

  Future<DefaultResponse<UserInfo>?> getProfile(String name, String token) async {
    var url = Uri.parse(_apiUrl + 'profile/get');
    var response = await _client.post(url, body: <String, dynamic>{
      'name': name,
      'token': token,
    });
    if (response.statusCode == 200) {
      return DefaultResponse.fromJsonString(response.body, UserInfo.fromJson);
    }
    return null;
  }

  Future<void> getPurchaseHistory(String name, String token) async {
    var url = Uri.parse(_apiUrl + 'booking/history');
    var response = await _client.post(url, body: <String, dynamic>{
      'name': name,
      'token': token,
    });
    // print('history');
    // print(response.body);
  }

  Future<DefaultResponse<BonusInfo>?> getBonuses(String token) async {
    var url = Uri.parse(_apiUrl + 'bonus/get');
    var response = await _client.post(url, body: <String, dynamic>{'token': token});
    if(response.statusCode == 200){
      return DefaultResponse.fromJsonString(response.body, BonusInfo.fromJson);
    }
    return null;
  }

  Future<void> getStatusesList() async {
    var url = Uri.parse(_apiUrl + 'bonus/list');
    var response = await _client.get(url);
    // print('statuses');
    // print(response.body);
  }

  Future<void> activatePromo(String token, String promoCode) async {
    var url = Uri.parse(_apiUrl + 'promo/activate');
    var response = await _client.post(url,
        body: <String, dynamic>{'token': token, 'promo_code': promoCode});
  }
}
