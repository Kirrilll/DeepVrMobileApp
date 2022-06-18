import 'dart:developer';

import 'package:deepvr/locator.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/models/location.dart';
import 'package:deepvr/models/order.dart';
import 'package:deepvr/models/request.dart';
import 'package:http/http.dart' as http;

import '../models/booking_date_model/booking_date_model.dart';

class RemoteService{



  bool isInit = false;
  final _client = http.Client();
  late String _apiUrl;

  void init(String api) async {
    _apiUrl = api;
    locator.signalReady(this);
    isInit = true;
  }

  Future<List<GameTypeModel>?> getGameTypes() async {
    var uri = Uri.parse(_apiUrl + 'gameTypes');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return GameTypeModel.gameTypesFromJson(json);
    }
  }

  Future<List<GameModel>?> getGames() async{
    var uri = Uri.parse(_apiUrl + 'games');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return GameModel.gamesFromJson(json);
    }
  }
  
  Future<BookingDateModel?> getDates(int gameId, int questCount) async {
    var uri = Uri.parse(_apiUrl + 'booking-dates/$gameId?guest_quantity=$questCount');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return BookingDateModel.fromJsonStr(json);

    }
  }

  Future<Request?> postData(Order order, int gameId) async {
    var uri = Uri.parse(_apiUrl + 'booking-request/$gameId');

    var response  = await _client.post(uri, body: order.toJson());
    if(response.statusCode == 200){
      return Request.requestFromJson(response.body);
    }

  }
}