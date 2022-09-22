import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/locator.dart';

class AuthenticationModel with ChangeNotifier{
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  bool get isAuthenticated => _authenticationService.isAuthenticated;

  AuthenticationModel(){
    _authenticationService.addListener(() => notifyListeners());
  }

}