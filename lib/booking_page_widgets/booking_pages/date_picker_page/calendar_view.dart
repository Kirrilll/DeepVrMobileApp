import 'dart:developer';


import 'package:deepvr/entities/month.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'month_view.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    required this.calendar
  }) : super(key: key);

  final List<Month> calendar;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int currMonthIndex = 0;
  var calendarController = PageController();
 // final List<Month> calendar = Month.monthFromMap( locator<DateViewModel>().calendar.schedule);

  void  Function()? next(){
    if(currMonthIndex < widget.calendar.length - 1){
      return (){
        setState(() {
          currMonthIndex++;
        });
        calendarController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease
        );
      };
    }
    return null;
  }

  void  Function()?  previous(){
    if(currMonthIndex > 0){
      return (){
        setState(() {
          currMonthIndex--;
        });
        calendarController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease
        );
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          //Кнопки
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed:previous(),
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 10),
                    Text(
                      currMonthIndex > 0
                          ? widget.calendar[currMonthIndex -1].monthName
                          : '',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  '${widget.calendar[currMonthIndex].monthName} ${widget.calendar[currMonthIndex].year} г.',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                ),
                Row(
                  children: [
                    Text(
                      currMonthIndex < widget.calendar.length-1
                          ? widget.calendar[currMonthIndex + 1].monthName
                          : '',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                        onPressed: next(),
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 10),
                  ],
                ),
              ]),
          //Дни недели
          const SizedBox(height: 37),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
            DayOfWeek(dayOfWeek: 'ПН'),
            DayOfWeek(dayOfWeek: 'ВТ'),
            DayOfWeek(dayOfWeek: 'СР'),
            DayOfWeek(dayOfWeek: 'ЧТ'),
            DayOfWeek(dayOfWeek: 'ПТ'),
            DayOfWeek(dayOfWeek: 'СБ'),
            DayOfWeek(dayOfWeek: 'ВС'),
          ]),
          const SizedBox(height: 36),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: calendarController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.calendar.length,
              itemBuilder: (context, index)  => MonthView(month:widget.calendar[index])
            ),
          ),
        ],
      );
  }
}

class DayOfWeek extends StatelessWidget {
  const DayOfWeek({Key? key, required this.dayOfWeek}) : super(key: key);

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
          fontWeight: FontWeight.w400),
    );
  }
}
