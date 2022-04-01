import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_month_container.dart';
import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/month_entity.dart';
import 'package:deepvr/models/booking_date_model/booking_date_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerContainer extends StatelessWidget {
  const DatePickerContainer({
    Key? key,
    required this.calendar
  }) : super(key: key);

  final List<MonthEntity> calendar;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //Кнопки
        // Row(
        //   children: [
        //
        //   ],
        // ),
        const SizedBox(height: 37),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        SizedBox(
          height: 400,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            children: calendar
                .map((month) => DateMonthContainer(month: month.days))
                .toList(),
          ),
        )
        // DateMonthContainer(month: calendar.first.days)
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
        color: Color(0xFFABAFE5),
        letterSpacing: 0.34,
        fontWeight: FontWeight.w400
      ),
    );
  }
}

