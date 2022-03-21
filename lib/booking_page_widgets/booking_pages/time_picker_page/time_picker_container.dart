import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerContainer extends StatelessWidget {
  const TimePickerContainer({Key? key}) : super(key: key);

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
        children: const [
          TimePickerItem(isBooked: true, date: '11:00'),
          TimePickerItem(isBooked: false, date: '12:00'),
          TimePickerItem(isBooked: false, date: '13:00'),
          TimePickerItem(isBooked: false, date: '14:00'),
          TimePickerItem(isBooked: false, date: '14:40'),
          TimePickerItem(isBooked: true, date: '15:00'),
          TimePickerItem(isBooked: true, date: '15:50'),
        ],
    );
  }
}

