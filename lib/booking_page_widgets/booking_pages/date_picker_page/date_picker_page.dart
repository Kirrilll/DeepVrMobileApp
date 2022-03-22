import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {

  late String? _dates;
  var isLoaded = false;


  // getDates() async {
  //    _dates = await RemoteService().getGameTypes();
  //    if(_dates != null){
  //      setState(() {
  //        log(_dates!);
  //        isLoaded = true;
  //      });
  //    }
  // }

  @override
  void initState() {
    super.initState();
    //getDates();
  }

  @override
  Widget build(BuildContext context) {
    return  BookingPageMaket(
        stepNumber: 5,
        content: isLoaded?  SingleChildScrollView(child: Text(_dates!)): const CircularProgressIndicator(),
        stepTitle: 'Выебрите дату'
    );
  }
}
