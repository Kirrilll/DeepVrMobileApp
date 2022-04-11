import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/refactor/booking.dart';
import '../../default_button.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({
    Key? key,
    required this.booking
  }) : super(key: key);

  final Booking booking;



  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Бронирование'),
          const Spacer(),
          Text(booking.selectedType!.title),
          Text(booking.selectedGame!.title),
          Text('Игроков: ${booking.guestCount}'),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 10),
              Text(booking.selectedDate!.date.toString().replaceRange(10, booking.selectedDate!.date.toString().length, ''))
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 10),
              Text(booking.selectedTime!.time)
            ],
          ),
          const Spacer(),
          Text('Итого: ${booking.guestCount! * booking.selectedGame!.price }'),
          const Spacer()
        ]);
  }
}
