import 'dart:async';

import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/domain/models/user.dart';
import 'package:deepvr/locator.dart';

class AuthenticationModel {
  StreamController<User> userController = StreamController.broadcast();

  void dispose() {
    userController.close();
  }
}
