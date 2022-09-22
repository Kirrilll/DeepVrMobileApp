import 'dart:async';
import 'package:deepvr/features/authentication/data/entities/registration.dart';
import 'package:deepvr/features/authentication/data/repositories/authentication_repository.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_info.dart';
import 'package:deepvr/features/local_storage/entities/stored_data.dart';
import 'package:deepvr/features/profile/data/entities/default_response.dart';
import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/features/local_storage/services/storge_service.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/core/di/locator.dart';
import 'package:flutter/cupertino.dart';

import '../../data/entities/login.dart';
import '../../data/entities/user_info.dart';

class AuthenticationService with ChangeNotifier{
  final StorageService _storageService =  locator<StorageService>();
  final ProfileRepository _profileRepository = locator<ProfileRepository>();
  final AuthenticationRepository _authenticationRepository= locator<AuthenticationRepository>();
  late User user;
  bool _isAuthenticated = false;

  AuthenticationService();

  bool get isAuthenticated => _isAuthenticated;

  _setAuthenticated(bool value){
    _isAuthenticated = value;
    notifyListeners();
  }

  Future<AuthenticationService> init() async {
    final data = _storageService.getData();
    if(data != null){
      final response =  await _profileRepository.getProfile(data.userName, data.token);
      if(response != null && response.error == 0){
        user = User(data.token, data.userName, response.response!.telephone);
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

  void _signIn(User user){
    this.user = user;
    _storageService.setData(StoredData(token: user.token!, userName: user.login!));
    _setAuthenticated(true);
  }

  Future<AuthenticationInfo> login(Login login) async{
    final response = await _authenticationRepository.login(login);
    if(response == null ){
      return AuthenticationInfo(isError: true, message: 'Потеряно соединение');
    }
    else if(response.error == 0){
      _signIn(User(response.token, response.response!.name, response.response!.telephone));
      return AuthenticationInfo(isError: false);
    }
    else{
      return AuthenticationInfo(isError: true, message: response.message);
    }
  }

  Future<AuthenticationInfo> registration(Registration registration, String name) async {
    final response = await _authenticationRepository.registration(registration);
    if(response == null){
      return AuthenticationInfo(isError: true, message: 'Потеряно соединение');
    }
    else if(response.error == 0){
      final profileResponse = await _profileRepository.setProfile(name, response.token!);
      _signIn(User(response.token, name, registration.phone));
      return AuthenticationInfo(isError: false);
    }
    else{
      return AuthenticationInfo(isError: true, message: response.message);
    }
  }

  Future<void> signOut() async{
    _authenticationRepository.logout(user.token!);
    user = User.initial();
    _setAuthenticated(false);
    await _storageService.clear();
  }





}
