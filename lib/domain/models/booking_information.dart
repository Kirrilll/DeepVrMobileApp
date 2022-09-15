import 'package:deepvr/domain/models/booking.dart';

class BookingInformation{
  int guestCount;
  String guestTime;
  String guestDate;
  String gameTitle;
  String roomTitle;
  int bookingPrice;
  int? promoCodeDiscount;
  int? bonusesDiscount;

  //TODO убрать
  factory BookingInformation.fromBooking(Booking booking) => BookingInformation(
      guestTime: booking.selectedTime!.time,
      gameTitle: booking.selectedGame!.title,
      roomTitle: booking.selectedType!.title,
      guestDate: booking.selectedDate!.date.toString().substring(0, 10),
      guestCount: booking.guestCount!,
      bookingPrice: booking.selectedGame!.price * booking.guestCount!
  );

  int get finalPrice => bookingPrice - (promoCodeDiscount ?? 0) - (bonusesDiscount ?? 0);

//<editor-fold desc="Data Methods">

  BookingInformation({
    required this.guestCount,
    required this.guestTime,
    required this.guestDate,
    required this.gameTitle,
    required this.roomTitle,
    required this.bookingPrice,
    this.promoCodeDiscount,
    this.bonusesDiscount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingInformation &&
          runtimeType == other.runtimeType &&
          guestCount == other.guestCount &&
          guestTime == other.guestTime &&
          guestDate == other.guestDate &&
          gameTitle == other.gameTitle &&
          roomTitle == other.roomTitle &&
          bookingPrice == other.bookingPrice &&
          promoCodeDiscount == other.promoCodeDiscount &&
          bonusesDiscount == other.bonusesDiscount);

  @override
  int get hashCode =>
      guestCount.hashCode ^
      guestTime.hashCode ^
      guestDate.hashCode ^
      gameTitle.hashCode ^
      roomTitle.hashCode ^
      bookingPrice.hashCode ^
      promoCodeDiscount.hashCode ^
      bonusesDiscount.hashCode;

  @override
  String toString() {
    return 'BookingInformation{' +
        ' guestCount: $guestCount,' +
        ' guestTime: $guestTime,' +
        ' guestDate: $guestDate,' +
        ' gameTitle: $gameTitle,' +
        ' roomTitle: $roomTitle,' +
        ' bookingPrice: $bookingPrice,' +
        ' promoCodeDiscount: $promoCodeDiscount,' +
        ' bonusesDiscount: $bonusesDiscount,' +
        '}';
  }

  BookingInformation copyWith({
    int? guestCount,
    String? guestTime,
    String? guestDate,
    String? gameTitle,
    String? roomTitle,
    int? bookingPrice,
    int? promoCodeDiscount,
    int? bonusesDiscount,
  }) {
    return BookingInformation(
      guestCount: guestCount ?? this.guestCount,
      guestTime: guestTime ?? this.guestTime,
      guestDate: guestDate ?? this.guestDate,
      gameTitle: gameTitle ?? this.gameTitle,
      roomTitle: roomTitle ?? this.roomTitle,
      bookingPrice: bookingPrice ?? this.bookingPrice,
      promoCodeDiscount: promoCodeDiscount ?? this.promoCodeDiscount,
      bonusesDiscount: bonusesDiscount ?? this.bonusesDiscount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'guestCount': guestCount,
      'guestTime': guestTime,
      'guestDate': guestDate,
      'gameTitle': gameTitle,
      'roomTitle': roomTitle,
      'bookingPrice': bookingPrice,
      'promoCodeDiscount': promoCodeDiscount,
      'bonusesDiscount': bonusesDiscount,
    };
  }

  factory BookingInformation.fromMap(Map<String, dynamic> map) {
    return BookingInformation(
      guestCount: map['guestCount'] as int,
      guestTime: map['guestTime'] as String,
      guestDate: map['guestDate'] as String,
      gameTitle: map['gameTitle'] as String,
      roomTitle: map['roomTitle'] as String,
      bookingPrice: map['bookingPrice'] as int,
      promoCodeDiscount: map['promoCodeDiscount'] as int,
      bonusesDiscount: map['bonusesDiscount'] as int,
    );
  }

//</editor-fold>
}