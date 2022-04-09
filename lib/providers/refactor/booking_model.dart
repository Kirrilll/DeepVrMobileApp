import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';

class BookingModel {
  //Храним все выбранное
  //Должен знать какая сейчас страница
  GameTypeViewModel? selectedType;
  GamesViewModel? selectedGame;
  //У Counter сделать функцию increment, которая получает знач, и лимиты
  int? guestCount;
  DateEntity? selectedDate;
  TimeEntity? selectedTime;
  String? name;
  String? phone;

  BookingModel.initial(){
    selectedType = null;
    selectedGame = null;
    guestCount = null;
    selectedDate = null;
    selectedTime = null;
    name = null;
    phone = null;
  }


}