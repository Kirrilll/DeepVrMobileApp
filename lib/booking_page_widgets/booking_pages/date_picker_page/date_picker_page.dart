import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/calendar_view.dart';
import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/entities/month.dart';
import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/booking_date_model/booking_date_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {


  //Возможно стоит пустить здесь Stream и из него данные получать
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider.value(
      value: locator<DateViewModel>(),
      child: Consumer<DateViewModel>(
        builder: (context, model, child) => BookingPageMaket(
            stepNumber: 4,
            content: model.pageState == PageState.loaded
                ? Calendar( calendar: Month.monthFromMap(model.calendar.schedule))
                : const Center(child:  CircularProgressIndicator()),
            stepTitle: 'Выберите дату'
        ),
      ),
    );
  }
}
