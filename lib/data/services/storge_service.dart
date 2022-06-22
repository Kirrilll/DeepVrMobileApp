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

  Future<bool> setName(String name) async {
    return await _storage.setString('name', name);
  }
  String? getName(){
    return _storage.getString('name');
  }

  Future<void> clear() async {
    await _storage.clear();
  }
}