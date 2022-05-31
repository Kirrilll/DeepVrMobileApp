import 'package:deepvr/enums/identification_routes.dart';
import 'package:deepvr/ui/pages/profile/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class IdentificationModel with ChangeNotifier{
  final List<IdentificationRoutes> _history = List.empty(growable: true);

  IdentificationModel(){
    _history.add(IdentificationRoutes.signIn);
  }
  IdentificationRoutes get route => _history.last;

  void navigateNamed(IdentificationRoutes route){
    _history.add(route);
    notifyListeners();
  }

  void pop(){
    _history.removeLast();
    notifyListeners();
  }

}