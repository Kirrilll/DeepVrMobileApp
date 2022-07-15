import 'dart:async';
import 'package:deepvr/data/entities/stored_data.dart';
import 'package:deepvr/data/entities/user_info.dart';
import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationModel with ChangeNotifier{
  final StorageService _storageService =  locator<StorageService>();
  final ProfileService _profileService = locator<ProfileService>();
  late User user;
  bool _isAuthenticated = false;

  AuthenticationModel();

  bool get isAuthenticated => _isAuthenticated;

  _setAuthenticated(bool value){
    _isAuthenticated = value;
    notifyListeners();
  }

  Future<AuthenticationModel> init() async {
    final data = _storageService.getData();
    if(data != null){
      final response =  await _profileService.getProfile(data.userName, data.token);
      if(response != null && response.error == 0){
        user = User(data.token, data.userName, response.response!.telephone);
        print(user);
        print('---------------------');
        _setAuthenticated(true);
      }
      else{
        user = User.initial();
      }
    }
    else {
      user = User.initial();
    }
    return this;
  }


  void signIn(User user){
    this.user = user;
    _storageService.setData(StoredData(token: user.token!, userName: user.login!));
    _setAuthenticated(true);
  }

  Future<void> signOut() async{
    user = User.initial();
    _setAuthenticated(false);
    await _storageService.clear();
  }

}
