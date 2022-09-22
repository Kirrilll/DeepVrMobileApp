import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/domain/models/booking_information.dart';
import 'package:deepvr/features/booking/ui/widgets/booking_info_row.dart';
import 'package:deepvr/features/booking/ui/widgets/booking_price_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingInformationScreen extends StatelessWidget {
  const BookingInformationScreen({
    Key? key,
    required this.bookingInformation
  }) : super(key: key);

  final BookingInformation bookingInformation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
        const SizedBox(height: 43),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'БРОНИРОВАНИЕ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BookingInfoRow.text(text: 'Зал', value: bookingInformation.roomTitle),
              const SizedBox(height: 16),
              BookingInfoRow.image(path: 'assets/icons/nav_games_icon.png', value: bookingInformation.gameTitle),
              const SizedBox(height: 16),
              BookingInfoRow.image(path: 'assets/icons/nav_profile_icon.png', value: bookingInformation.guestCount.toString()),
              const SizedBox(height: 16),
              BookingInfoRow.image(path: 'assets/icons/calendar.png', value: bookingInformation.guestDate),
              const SizedBox(height: 16),
              BookingInfoRow.image(path: 'assets/icons/access_time .png', value: bookingInformation.guestTime),
            ],
          ),
        ),
        const SizedBox(height: 34),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Color(0xFF1F2032)
          ),
          child: Column(
            children: [
              BookingPriceItem(title: 'Стоимость заказа', price: bookingInformation.bookingPrice),
              BookingPriceItem.discount(title: 'Промокоды', discount: bookingInformation.promoCodeDiscount),
              BookingPriceItem.discount(title: 'Бонусы', discount: bookingInformation.bonusesDiscount),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.5),
                height: 1,
                color: const Color(0xFF444656),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Итого:',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    '${bookingInformation.finalPrice} ₽',
                    style: const TextStyle(
                        fontSize: 36, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}

