import 'dart:async';
import 'package:deepvr/data/entities/registration.dart';
import 'package:deepvr/data/services/authentication_service.dart';
import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/data/services/storge_service.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';

class RegistrationModel with ChangeNotifier {
  FetchingState _signUpStatus = FetchingState.idle;
  String? _message;

  final ProfileService _profileService = locator<ProfileService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final AuthenticationModel _authenticationModel = locator<AuthenticationModel>();

  FetchingState get signUpStatus => _signUpStatus;
  String get message => _message!;

  Future<void> signUp(Registration registration, String name) async {
    setState(FetchingState.loading);
    final response = await _authenticationService.registration(registration);

    //Изменение профиля через set

    if(response == null){
      _message = 'Сервер не отвечает';
      setState(FetchingState.error);
    }
    else if(response.error == 0){
        final profileResponse = await _profileService.setProfile(name, response.token!);
        _authenticationModel.signIn(User(response.token, name, registration.phone));
        setState(FetchingState.successful);
    }
    else{
      _message = response.message;
      setState(FetchingState.error);
    }

  }

  void setState(FetchingState state){
    _signUpStatus = state;
    notifyListeners();
  }

}