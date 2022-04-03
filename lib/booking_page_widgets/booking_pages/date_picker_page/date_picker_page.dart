import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_container.dart';
import 'package:deepvr/entities/month_entity.dart';
import 'package:deepvr/models/booking_date_model/booking_date_model.dart';
import 'package:deepvr/providers/booking_provider.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  @override
  void initState() {
    Provider.of<BookingProvider>(context, listen: false).getDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bookingProvider = Provider.of<BookingProvider>(context,listen: true);
    return  BookingPageMaket(
        stepNumber: 5,
        content: bookingProvider.isLoadedDate
            ? DatePickerContainer(calendar: MonthEntity.monthsFromMap(bookingProvider.bookingDateModel!.schedule))
            : const Center(child:  CircularProgressIndicator()),
        stepTitle: 'Выебрите дату'
    );
  }
}
