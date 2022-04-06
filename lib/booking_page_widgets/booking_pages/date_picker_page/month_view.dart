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

  Stream<List<DateEntity?>> _daysStream() async*{
    List<DateEntity?> days = List.of(month.days, growable: true);
    if(days.first!.date.weekday!= 1){
      for(int i =0; i < days.first!.date.weekday; i++){
        days.add(null);
      }
    }
    yield days;
    // List<Widget> days = List.empty(growable: true);
    // var tempDays = List.of(month.days);
    //
    // int currWeekday = 0;
    // while(tempDays.isNotEmpty){
    //   if(tempDays.first.date.weekday == currWeekday + 1){
    //     days.add(DateView(date: DateEntity.copyFrom(tempDays.first)));
    //     tempDays.removeAt(0);
    //   }
    //   else{
    //     days.add(DateView.empty());
    //   }
    //   currWeekday = (currWeekday +1) % 7;
    // }
    //
    // yield days;
  }

  //попробовать сделать это stream, а потом это загружать
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
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32, //padding c каждой стороне по 16
      child: StreamBuilder<List<DateEntity?>>(
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
              itemBuilder: (context, index){
                if(snapshot.data![index] == null) {
                  return DateView.empty();
                }
                return DateView(date: snapshot.data![index]);
              }
          )
          : const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}
