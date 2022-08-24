import 'dart:async';
import 'package:deepvr/features/authentication/data/entities/registration.dart';
import 'package:deepvr/features/authentication/data/repositories/authentication_repository.dart';
import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/locator.dart';

class RegistrationModel with ChangeNotifier {
  FetchingState _signUpStatus = FetchingState.idle;
  String? _message;
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  FetchingState get signUpStatus => _signUpStatus;
  String get message => _message!;

  Future<void> signUp(Registration registration, String name) async {
    _message = null;
    setState(FetchingState.loading);
    final authInfo = await _authenticationService.registration(registration, name);
    if(authInfo.isError){
      _message = authInfo.message;
      setState(FetchingState.error);
    }
    else{
      setState(FetchingState.successful);
    }

  }

  void setState(FetchingState state){
    _signUpStatus = state;
    notifyListeners();
  }

}