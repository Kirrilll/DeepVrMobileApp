import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{

  late SharedPreferences _storage;

  Future<StorageService> init() async {
    WidgetsFlutterBinding.ensureInitialized();
     _storage = await SharedPreferences.getInstance();
     return this;
  }


  Future<bool> setToken(String token) async{
    final result = await _storage.setString('token', token);
    return result;
  }

  String? getToken(){
    return _storage.getString('token');
  }
}