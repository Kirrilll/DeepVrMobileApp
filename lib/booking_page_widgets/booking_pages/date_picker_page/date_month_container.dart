import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_item.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/entities/date_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateMonthContainer extends StatelessWidget {
  const DateMonthContainer({Key? key, required this.month}) : super(key: key);

  final List<DateEntity> month;

  //Как-то да работает


  Map<int, List<DateEntity?>> _buildWeeks(){
    Map<int, List<DateEntity?>> weeksMap = {};
    List<DateEntity?> week = List.filled(7, null);
    int weekIndex = 0;
    for(DateEntity date in month){
      week[date.date.weekday -1] = date;
      if(date.date.weekday == 7){
        weeksMap.addAll({weekIndex: [...week]});
        weekIndex++;
        week = List.filled(7, null);
      }
    }
    return weeksMap;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildWeeks().values.toList().map((week) => WeekRow(week: week)).toList()
        )
      );
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       Column(
    //         children: month
    //             .where((day) => day.date.weekday == 1)
    //             .map((day) => DatePickerItem(setDay: () => print('sf'), dateEntity: day))
    //             .toList(),
    //       ),
    //       Column(
    //         children: month
    //             .where((day) => day.date.weekday == 2)
    //             .map((day) => DatePickerItem(setDay: () => print('sf'), dateEntity: day))
    //             .toList(),
    //       ),
    //       Column(
    //         children: month
    //             .where((day) => day.date.weekday == 3)
    //             .map((day) => DatePickerItem(setDay: () => print('sf'), dateEntity: day))
    //             .toList(),
    //       ),
    //       Column(
    //         children: month
    //             .where((day) => day.date.weekday == 4)
    //             .map((day) => DatePickerItem(setDay: () => print('sf'), dateEntity: day))
    //             .toList(),
    //       ),
    //       Column(
    //         children: month
    //             .where((day) => day.date.weekday == 5)
    //             .map((day) => DatePickerItem(setDay: () => print('sf'), dateEntity: day))
    //             .toList(),
    //       ),
    //       Column(
    //         children: month
    //             .where((day) => day.date.weekday == 6)
    //             .map((day) => DatePickerItem(setDay: () => print('sf'), dateEntity: day))
    //             .toList(),
    //       ),
    //       Column(
    //         children: month
    //             .where((day) => day.date.weekday == 7)
    //             .map((day) => DatePickerItem(setDay: () => print('sf'), dateEntity: day))
    //             .toList(),
    //       ),
    //     ],
    //   ),
    // );
  }
}

//Билд ряда
class WeekRow extends StatelessWidget {
  const WeekRow({
    Key? key,
    required this.week
  }) : super(key: key);

  final List<DateEntity?> week;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: week
              .map((day) => day != null
                ? DatePickerItem(setDay: () => print(day), dateEntity: day)
                : const SizedBox(height: 20, width: 30))
              .toList(),
        ),
      ],
    );
  }
}


