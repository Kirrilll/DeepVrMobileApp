import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/booking/data/entities/game_type.dart';
import 'package:deepvr/domain/models/time.dart';

import 'date.dart';

class Booking {
  GameType? selectedType;
  Game? selectedGame;
  int? guestCount;
  Date? selectedDate;
  Time? selectedTime;
  String? phone;
  String? name;
  String? comment;
  bool? isAgree;

  Booking.initial() {
    selectedType = null;
    selectedGame = null;
    guestCount = null;
    selectedDate = null;
    selectedTime = null;
    comment = null;
    name = null;
    phone = null;
  }

  Booking(
      this.selectedType,
      this.selectedGame,
      this.guestCount,
      this.selectedDate,
      this.selectedTime,
      this.isAgree,
      this.phone,
      this.name,
      this.comment);

  factory Booking.copyWith(Booking booking,
      {GameType? selectedType,
      Game? selectedGame,
      int? guestCount,
      Date? selectedDate,
      Time? selectedTime,
      bool? isAgree,
      String? name,
      String? phone,
      String? comment}) {
    return Booking(
        selectedType ?? booking.selectedType,
        selectedGame ?? booking.selectedGame,
        guestCount ?? booking.guestCount,
        selectedDate ?? booking.selectedDate,
        selectedTime ?? booking.selectedTime,
        isAgree ?? booking.isAgree,
        phone ?? booking.phone,
        name ?? booking.name,
        comment ?? booking.comment
    );


  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Booking &&
          runtimeType == other.runtimeType &&
          selectedType == other.selectedType &&
          selectedGame == other.selectedGame &&
          guestCount == other.guestCount &&
          selectedDate == other.selectedDate &&
          selectedTime == other.selectedTime &&
          phone == other.phone &&
          name == other.name &&
          isAgree == other.isAgree;

  @override
  int get hashCode =>
      selectedType.hashCode ^
      selectedGame.hashCode ^
      guestCount.hashCode ^
      selectedDate.hashCode ^
      selectedTime.hashCode ^
      phone.hashCode ^
      name.hashCode ^
      isAgree.hashCode;
}
