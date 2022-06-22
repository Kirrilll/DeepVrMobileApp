import 'dart:async';

import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/enums/identification_routes.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/ui/pages/profile/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class IdentificationRoutingModel with ChangeNotifier {
  final List<IdentificationRoutes> _history = List.empty(growable: true);
  final StorageService _storage = locator<StorageService>();
  late StreamSubscription _userSub;

  IdentificationRoutingModel() {
    init();
    Stream<User> userStream = locator<AuthenticationModel>().userController.stream;

    _userSub = userStream.listen((user) {
      if(user.token == null) {
        navigateNamed(IdentificationRoutes.signIn);
      }
      else {
        navigateNamed(IdentificationRoutes.profile);
      }
    });
  }
  IdentificationRoutes get route => _history.last;

  void init(){
    String? token = _storage.getToken();
    if(token == null) {
      _history.add(IdentificationRoutes.signIn);
    } else {
      _history.add(IdentificationRoutes.profile);
    }
  }

  void navigateNamed(IdentificationRoutes route) {
    _history.add(route);
    notifyListeners();
  }

  void pop() {
    _history.removeLast();
    notifyListeners();
  }

  @override
  void dispose() {
    _userSub.cancel().whenComplete(() => super.dispose());
    //super.dispose();
  }
}
