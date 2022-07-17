import 'package:deepvr/domain/models/date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/month.dart';
import 'date_item.dart';

class MonthItem extends StatelessWidget {
  const MonthItem({
    Key? key,
    required this.month
  }) : super(key: key);

  final Month month;

  Stream<List<Widget>> _daysStream() async*{
    List<Widget> days = List.empty(growable: true);
    var tempDays = List.of(month.days);

    int currWeekday = 0;
    while(tempDays.isNotEmpty){
      if(tempDays.first.date.weekday == currWeekday + 1){
        days.add(DateItem(date: Date.copyFrom(tempDays.first)));
        tempDays.removeAt(0);
      }
      else{
        days.add(DateItem.empty());
      }
      currWeekday = (currWeekday +1) % 7;
    }

    yield days;
  }

  //попробовать сделать это stream, а потом это загружать
  List<Widget> _daysBuilder(BuildContext context){
    List<Widget> days = List.empty(growable: true);
    var tempDays = List.of(month.days);

    int currWeekday = 0;
    while(tempDays.isNotEmpty){
      if(tempDays.first.date.weekday == currWeekday + 1){
        days.add(DateItem(date: Date.copyFrom(tempDays.first)));
        tempDays.removeAt(0);
      }
      else{
        days.add(DateItem.empty());
      }
      currWeekday = (currWeekday +1) % 7;
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32, //padding c каждой стороне по 16
        child: StreamBuilder<List<Widget>>(
          stream: _daysStream(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? GridView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => snapshot.data![index]
            )
            : const Center(child: CircularProgressIndicator());
          }
        ),
      ),
    );
  }
}
