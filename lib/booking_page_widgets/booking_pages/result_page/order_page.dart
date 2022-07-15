import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/booking.dart';

//TODO страница с инлексами в CustomStepper
class OrderPage extends StatelessWidget {
  const OrderPage({Key? key, required this.booking}) : super(key: key);

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(height: 43),
      const Text(
        'БРОНИРОВАНИЕ',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 46, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(91),
              1: FlexColumnWidth()
          },
          children: [
            TableRow(children: [
              const Text('Зал',
                  style: TextStyle(fontSize: 24, color: Color(0xFFABAFE5))),
              Text(booking.selectedType!.title,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ]),
            const TableRow(
              children: [SizedBox(height: 16),SizedBox(height: 16)]
            ),
            TableRow(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child:  ImageIcon(
                  AssetImage('assets/icons/nav_games_icon.png'),
                  color: Color(0xFFABAFE5),
                  size: 24,
                ),
              ),
              Text(booking.selectedGame!.title,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ]),
            const TableRow(
                children: [SizedBox(height: 16),SizedBox(height: 16)]
            ),
            TableRow(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child:  ImageIcon(
                  AssetImage('assets/icons/nav_profile_icon.png'),
                  color: Color(0xFFABAFE5),
                  size: 24,
                ),
              ),
              Text(booking.guestCount.toString(),
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ]),
            const TableRow(
                children: [SizedBox(height: 16),SizedBox(height: 16)]
            ),
            TableRow(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child:  ImageIcon(
                  AssetImage('assets/icons/calendar.png'),
                  color: Color(0xFFABAFE5),
                  size: 24,
                ),
              ),
              Text(booking.selectedDate!.date.toString().replaceRange(
                  10, booking.selectedDate!.date.toString().length, ''),
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ]),
            const TableRow(
                children: [SizedBox(height: 16),SizedBox(height: 16)]
            ),
            TableRow(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child:  ImageIcon(
                  AssetImage('assets/icons/access_time .png'),
                  color: Color(0xFFABAFE5),
                  size: 24,
                ),
              ),
              Text(booking.selectedTime!.time,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ]),
          ],
        ),
      ),
      const SizedBox(height: 34),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color(0xFF1F2032)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Стоимость заказа:',
                  style: TextStyle(fontSize: 16, color: Color(0xFFABAFE5)),
                ),
                Text(
                  '${booking.guestCount! * booking.selectedGame!.price} ₽',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
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
                  '${booking.guestCount! * booking.selectedGame!.price} ₽',
                  style: const TextStyle(fontSize: 36, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
      const Spacer(),
    ]);
  }
}

class ResultRow extends StatelessWidget {
  const ResultRow({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          text,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
