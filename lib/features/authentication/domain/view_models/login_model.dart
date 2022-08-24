import 'dart:async';
import 'package:deepvr/features/authentication/data/entities/login.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/core/domain/locator.dart';
import 'package:flutter/cupertino.dart';

class LoginModel with ChangeNotifier {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

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
    final authInfo = await _authenticationService.login(login);
    if(authInfo.isError){
      _message = authInfo.message;
      setState(FetchingState.error);
    }
    else {
      setState(FetchingState.successful);
    }
  }
}
