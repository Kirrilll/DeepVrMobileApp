import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/models/booking_date_model/booking_date_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  late BookingDateModel _bookingDateModel;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    RemoteService.getInstance().getDates(17).then(
            (value){
              _bookingDateModel = value!;
              setState(() {
                isLoaded = true;
              });
            }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  BookingPageMaket(
        stepNumber: 5,
        content: isLoaded?  SingleChildScrollView(child: Text('Date')): const CircularProgressIndicator(),
        stepTitle: 'Выебрите дату'
    );
  }
}
