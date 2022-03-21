import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerContainer extends StatelessWidget {
  const DatePickerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [

          ],
        ),
        const SizedBox(height: 37),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            DayOfWeek(dayOfWeek: 'ПН'),
            DayOfWeek(dayOfWeek: 'ВТ'),
            DayOfWeek(dayOfWeek: 'СР'),
            DayOfWeek(dayOfWeek: 'ЧТ'),
            DayOfWeek(dayOfWeek: 'ПТ'),
            DayOfWeek(dayOfWeek: 'СБ'),
            DayOfWeek(dayOfWeek: 'ВС'),
          ]
        ),
        const SizedBox(height: 36),

      ],
    );
  }
}

//Завести либо в Theme style, либо специальный класс и там это
class DayOfWeek extends StatelessWidget {
  const DayOfWeek({
    Key? key,
    required this.dayOfWeek
  }) : super(key: key);

  final String dayOfWeek;

  @override
  Widget build(BuildContext context) {
    return Text(
      dayOfWeek,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        letterSpacing: 0.34,
        fontWeight: FontWeight.w400
      ),
    );
  }
}

