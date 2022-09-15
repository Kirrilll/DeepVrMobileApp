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
  String? promoCode;
  int? discountPercent;


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

  factory Booking.copyWith(Booking booking,
      {GameType? selectedType,
      Game? selectedGame,
      int? guestCount,
      Date? selectedDate,
      Time? selectedTime,
      bool? isAgree,
      String? name,
      String? phone,
      String? comment,
        String? promoCode,
        int? discountPercent
      }) {
    return Booking(
      selectedType: selectedType ?? booking.selectedType,
      selectedGame: selectedGame ?? booking.selectedGame,
      guestCount: guestCount ?? booking.guestCount,
      selectedDate: selectedDate ?? booking.selectedDate,
      selectedTime: selectedTime ?? booking.selectedTime,
      phone: phone ?? booking.phone,
      name: name ?? booking.name,
      comment: comment ?? booking.comment,
      promoCode: promoCode ?? booking.promoCode,
      discountPercent: discountPercent ?? booking.discountPercent,
    );


  }

  Booking({
    this.selectedType,
    this.selectedGame,
    this.guestCount,
    this.selectedDate,
    this.selectedTime,
    this.phone,
    this.name,
    this.comment,
    this.promoCode,
    this.discountPercent,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Booking &&
              runtimeType == other.runtimeType &&
              selectedType == other.selectedType &&
              selectedGame == other.selectedGame &&
              guestCount == other.guestCount &&
              selectedDate == other.selectedDate &&
              selectedTime == other.selectedTime &&
              phone == other.phone &&
              name == other.name &&
              comment == other.comment &&
              promoCode == other.promoCode &&
              discountPercent == other.discountPercent
          );


  @override
  int get hashCode =>
      selectedType.hashCode ^
      selectedGame.hashCode ^
      guestCount.hashCode ^
      selectedDate.hashCode ^
      selectedTime.hashCode ^
      phone.hashCode ^
      name.hashCode ^
      comment.hashCode ^
      promoCode.hashCode ^
      discountPercent.hashCode;


  @override
  String toString() {
    return 'Booking{' +
        ' selectedType: $selectedType,' +
        ' selectedGame: $selectedGame,' +
        ' guestCount: $guestCount,' +
        ' selectedDate: $selectedDate,' +
        ' selectedTime: $selectedTime,' +
        ' phone: $phone,' +
        ' name: $name,' +
        ' comment: $comment,' +
        ' promoCode: $promoCode,' +
        ' discountPercent: $discountPercent,' +
        '}';
  }


  Booking copyWith({
    GameType? selectedType,
    Game? selectedGame,
    int? guestCount,
    Date? selectedDate,
    Time? selectedTime,
    String? phone,
    String? name,
    String? comment,
    String? promoCode,
    int? discountPercent,
  }) {
    return Booking(
      selectedType: selectedType ?? this.selectedType,
      selectedGame: selectedGame ?? this.selectedGame,
      guestCount: guestCount ?? this.guestCount,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      comment: comment ?? this.comment,
      promoCode: promoCode ?? this.promoCode,
      discountPercent: discountPercent ?? this.discountPercent,
    );
  }
}
