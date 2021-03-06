import 'dart:developer';
import 'package:deepvr/locator.dart';
import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/data/entities/request.dart';
import 'package:http/http.dart' as http;

import '../entities/booking_calendar.dart';

class BookingService{
  bool isInit = false;
  final _client = http.Client();
  late String _apiUrl;

  void init(String api) async {
    _apiUrl = api;
    locator.signalReady(this);
    isInit = true;
  }

  Future<List<GameType>?> getGameTypes() async {
    var uri = Uri.parse(_apiUrl + 'gameTypes');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return GameType.gameTypesFromJson(json);
    }
  }

  
  Future<BookingCalendar?> getDates(int gameId, int questCount) async {
    var uri = Uri.parse(_apiUrl + 'booking-dates/$gameId?guest_quantity=$questCount');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return BookingCalendar.fromJsonStr(json);

    }
  }

  Future<Request?> book(Map<String, dynamic> data, int gameId) async {
    var uri = Uri.parse(_apiUrl + 'booking-request/$gameId');
    var response  = await _client.post(uri, body: data);
    if(response.statusCode == 200){
      return Request.requestFromJson(response.body);
    }
    return null;
  }
}