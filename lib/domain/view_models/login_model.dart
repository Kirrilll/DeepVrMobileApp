import 'dart:async';

import 'package:deepvr/data/entities/default_response.dart';
import 'package:deepvr/data/entities/login.dart';
import 'package:deepvr/data/services/authentication_service.dart';
import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';

class LoginModel with ChangeNotifier {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final AuthenticationModel _authenticationModel = locator<AuthenticationModel>();

  FetchingState _state = FetchingState.idle;
  String? _message;

  FetchingState get state => _state;
  String? get message => _message;

  void setState(FetchingState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> login(Login login) async {
    _message = null;
    setState(FetchingState.loading);
    final response = await _authenticationService.login(login);
    if(response == null ){
      _message = 'Сервер не отвечает';
      setState(FetchingState.error);
    }
    else if(response.error == 0){
      _authenticationModel.signIn(User(response.token, response.response!.name, response.response!.telephone));
      setState(FetchingState.successful);
    }
    else{
      _message = response.message;
      setState(FetchingState.error);
    }
  }
}
