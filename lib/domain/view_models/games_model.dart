import 'package:deepvr/data/services/games_service.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:flutter/cupertino.dart';

import '../../data/entities/game.dart';
import '../../locator.dart';

class GamesModel with ChangeNotifier{
  var _isLoaded = false;
  List<Game>? _games;

  bool get isLoaded => _isLoaded;
  List<Game>? get games => _games;


  void getGames() async{
    locator<GamesService>().getAllGames().then((res){
      _games = res;
      _isLoaded = true;
      notifyListeners();
    });
  }
}