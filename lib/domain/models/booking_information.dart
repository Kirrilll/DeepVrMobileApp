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

  BookingInformation({
    required this.guestCount,
    required this.guestTime,
    required this.guestDate,
    required this.gameTitle,
    required this.roomTitle,
    required this.bookingPrice,
    this.bonusesDiscount,
    this.promoCodeDiscount
  });
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



}