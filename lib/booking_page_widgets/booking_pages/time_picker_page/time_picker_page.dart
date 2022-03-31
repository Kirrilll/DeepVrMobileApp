import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerPage extends StatelessWidget {
  const TimePickerPage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const BookingPageMaket(
        stepNumber: 5,
        content:  TimePickerContainer(),
        stepTitle: 'Выберите подходящее время'
    );
  }
}
