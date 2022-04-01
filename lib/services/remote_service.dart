import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:http/http.dart' as http;

import '../models/booking_date_model/booking_date_model.dart';

class RemoteService{

  static final RemoteService _instance = RemoteService._();

  final _client = http.Client();
  final _apiUrl = 'https://srt.vrbook.creatrix-digital.ru/api/';

  RemoteService._(){}

  factory RemoteService.getInstance  () => _instance;

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
  
  Future<BookingDateModel?> getDates(int gameId) async {
    var uri = Uri.parse(_apiUrl + 'booking-dates/$gameId');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return BookingDateModel.fromJsonStr(json);
    }
  }

  Future<String?> getDates2(int gameId) async {
    var uri = Uri.parse(_apiUrl + 'quests/timetable/$gameId');
    var response = await _client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return json;
    }
  }
}