import 'package:deepvr/features/profile/data/entities/client_purchase.dart';
import 'package:deepvr/features/profile/data/entities/default_response.dart';
import 'package:deepvr/features/profile/data/entities/loyalty_status.dart';
import 'package:deepvr/features/authentication/data/entities/user_info.dart';
import 'package:http/http.dart' as http;

import '../entities/bonus_info.dart';

class ProfileRepository {
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

  Future<DefaultResponse<List<ClientPurchase>>?> getPurchaseHistory( String token) async {
    var url = Uri.parse(_apiUrl + 'booking/history');
    var response = await _client.post(url, body: <String, dynamic>{
      'token': token,
    });
    if(response.statusCode == 200){
      return DefaultResponse.fromJsonString(response.body, ClientPurchase.listFromJson);
    }
    return null;
  }

  Future<DefaultResponse<BonusInfo>?> getBonuses(String token) async {
    var url = Uri.parse(_apiUrl + 'bonus/get');
    var response = await _client.post(url, body: <String, dynamic>{'token': token});
    if(response.statusCode == 200){
      return DefaultResponse.fromJsonString(response.body, BonusInfo.fromJson);
    }
    return null;
  }

  Future<DefaultResponse<List<LoyaltyStatus>>?> getStatusesList() async {
    var url = Uri.parse(_apiUrl + 'bonus/list');
    var response = await _client.get(url);
    if(response.statusCode == 200){
      return DefaultResponse.fromJsonString(response.body, LoyaltyStatus.listFromJson);
    }
    return null;
  }

  Future<DefaultResponse<List>?> activatePromo(String token, String promoCode) async {
    var url = Uri.parse(_apiUrl + 'promo/activate');
    var response = await _client.post(url, body: <String, dynamic>{'token': token, 'promo_code': promoCode});
    if(response.statusCode == 200){
      return DefaultResponse.fromJsonString(response.body, (body) => List.empty());
    }
    return null;
  }
}
