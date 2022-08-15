import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/domain/models/date.dart';
import 'package:deepvr/domain/models/time.dart';

class BookingHelper {
  bool isValueSelected<T>(T? value) => value != null;


  Booking setGameType(GameType? gameType, Booking origin) => Booking.copyWith(
      Booking.initial(),
      selectedType: gameType,
      phone: origin.phone,
      name: origin.name
  );

  Booking setGame(Game? game, Booking origin) => Booking.copyWith(
      Booking.initial(),
      selectedType: origin.selectedType,
      selectedGame: game,
      guestCount: game!.guestMin ?? game.gameType.guestMin,
      phone: origin.phone,
      name: origin.name
  );

  Booking setGuestCount(int? count, Booking origin) => Booking.copyWith(
    Booking.initial(),
    selectedType: origin.selectedType,
    selectedGame: origin.selectedGame,
    guestCount: count,
      phone: origin.phone,
      name: origin.name
  );


  Booking setDate(Date? date, Booking origin) => Booking.copyWith(
      Booking.initial(),
      selectedType: origin.selectedType,
      selectedGame: origin.selectedGame,
      guestCount: origin.guestCount,
      selectedDate: date,
      phone: origin.phone,
      name: origin.name
  );

  Booking setTime(Time? time, Booking origin) => Booking.copyWith(
    origin,
    selectedTime: time
  );

  Booking setAgreed(bool agree, Booking origin) => Booking.copyWith(origin, isAgree: agree);

  Booking setPhone(String? phone, Booking origin) => Booking.copyWith(origin, phone: phone);

  Booking setName(String? name, Booking origin) => Booking.copyWith(origin, name: name);

  Booking setComment(String? comment, Booking origin) => Booking.copyWith(origin, comment: comment);
}
