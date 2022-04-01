import 'package:deepvr/providers/booking_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../booking_page_switch_btn.dart';

class BookingResultPage extends StatelessWidget {
  const BookingResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF36C0E7), Color(0xFF4B51EA)]),
            borderRadius: BorderRadius.circular(15)),
        child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.secondaryContainer
        ),
          padding: const EdgeInsets.all(15),
          child: Consumer<BookingProvider>(
              builder: (context, bookingProvider, _) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Бронирование'),
                  Spacer(),
                  Text(bookingProvider.selectedGameType!.title),
                  Text(bookingProvider.selectedGame!.title),
                  Text('Игроков: ${bookingProvider.guestCount}'),
                  Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 10),
                      Text(bookingProvider.selectedDate!.date.toString())
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children:  [
                      Icon(Icons.access_time),
                      SizedBox(width: 10),
                      Text(bookingProvider.selectedTime!.time)
                    ],
                  ),
                  Spacer(),
                  Text('Итого: ${bookingProvider.selectedGame!.price * bookingProvider.guestCount}'),
                  Spacer(),
                  BookPageSwitchingBtn(action: () => print('publish'), text: 'Забронировать')
                ]);
          }),
        ),
      ),
    );
  }
}
