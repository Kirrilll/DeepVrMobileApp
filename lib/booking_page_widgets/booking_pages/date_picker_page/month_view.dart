import 'package:deepvr/entities/date_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../entities/month.dart';
import 'date_view.dart';

class MonthView extends StatelessWidget {
  const MonthView({
    Key? key,
    required this.month
  }) : super(key: key);

  final Month month;

  List<Widget> _daysBuilder(BuildContext context){
    List<Widget> days = List.empty(growable: true);
    var tempDays = List.of(month.days);

    int currWeekday = 0;
    while(tempDays.isNotEmpty){
      if(tempDays.first.date.weekday == currWeekday + 1){
        days.add(DateView(date: DateEntity.copyFrom(tempDays.first)));
        tempDays.removeAt(0);
      }
      else{
        days.add(DateView.empty());
      }
      currWeekday = (currWeekday +1) % 7;
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    print( month.days.length);
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32, //padding c каждой стороне по 16
      child: GridView.count(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 7,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          children: _daysBuilder(context),
      ),
    );
  }
}
