import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_container.dart';
import 'package:deepvr/providers/booking_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimePickerPage extends StatelessWidget {
  const TimePickerPage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BookingPageMaket(
        stepNumber: 5,
        content:  TimePickerContainer(avaliblesTime: Provider.of<BookingProvider>(context).selectedDate!.availableTime),
        stepTitle: 'Выберите подходящее время'
    );
  }
}
