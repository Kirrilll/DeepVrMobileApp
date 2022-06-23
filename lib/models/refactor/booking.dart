import 'package:deepvr/data/entities/game.dart';
import 'package:deepvr/data/entities/game_type.dart';

import '../../entities/date_entity.dart';
import '../../entities/time_entity.dart';

class Booking {
  GameType? selectedType;
  Game? selectedGame;

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
      GameType? selectedType,
      Game? selectedGame,
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
