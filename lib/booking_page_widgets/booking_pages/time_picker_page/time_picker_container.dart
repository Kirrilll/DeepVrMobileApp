import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_item.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerContainer extends StatelessWidget {
  const TimePickerContainer({
    Key? key,
    required this.avaliblesTime
  }) : super(key: key);

  final List<TimeEntity> avaliblesTime;

  //В теории данные приходят сюда
  @override
  Widget build(BuildContext context) {

    return
      GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 80,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16
        ),
        children: avaliblesTime.map((time) => TimePickerItem(time: time)).toList(),
    );
  }
}

