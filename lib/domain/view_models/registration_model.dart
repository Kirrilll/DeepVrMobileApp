import 'package:deepvr/data/entities/registration.dart';
import 'package:deepvr/data/services/authentication_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/data/services/storge_service.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';

class RegistrationModel with ChangeNotifier {
  FetchingState _signUpStatus = FetchingState.idle;
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final Sink<User> userSink = locator<AuthenticationModel>().userController.sink;
  // final StorageService _storage = locator<StorageService>();

  FetchingState get signUpStatus => _signUpStatus;

  Future<void> signUp(Registration registration) async {
    setState(FetchingState.loading);
    final response = await _authenticationService.registration(registration);
    if(response != null){
      userSink.add(User(response.token, 'Имя', registration.phone));
      setState(FetchingState.successful);
      // await _storage.setToken(response.token!);
    }
    setState(FetchingState.error);
  }

  void setState(FetchingState state){
    _signUpStatus = state;
    notifyListeners();
  }

}