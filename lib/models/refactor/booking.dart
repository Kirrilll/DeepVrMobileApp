import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/models/game_type_model.dart';

import '../../entities/date_entity.dart';
import '../../entities/time_entity.dart';

class Booking {
  GameTypeModel? selectedType;
  GameModel? selectedGame;

  //У Counter сделать функцию increment, которая получает знач, и лимиты
  int? guestCount;
  DateEntity? selectedDate;
  TimeEntity? selectedTime;
  String? name;
  String? phone;

  Booking.initial() {
    selectedType = null;
    selectedGame = null;
    guestCount = null;
    selectedDate = null;
    selectedTime = null;
    name = null;
    phone = null;
  }

  Booking(this.selectedType, this.selectedGame, this.guestCount,
      this.selectedDate, this.selectedTime, this.name, this.phone);

  factory Booking.copyWith(
      Booking booking,{
      GameTypeModel? selectedType,
      GameModel? selectedGame,
      int? guestCount,
      DateEntity? selectedDate,
      TimeEntity? selectedTime,
      String? name,
      String? phone}) {
    return Booking(
        selectedType ?? booking.selectedType,
        selectedGame ?? booking.selectedGame,
        guestCount ?? booking.guestCount,
        selectedDate ?? booking.selectedDate,
        selectedTime ?? booking.selectedTime,
        name ?? booking.name,
        phone ?? booking.phone);
  }



  @override
  String toString() {
    return 'Booking{selectedType: $selectedType, selectedGame: $selectedGame, guestCount: $guestCount, selectedDate: $selectedDate, selectedTime: $selectedTime, name: $name, phone: $phone}';
  }


}
