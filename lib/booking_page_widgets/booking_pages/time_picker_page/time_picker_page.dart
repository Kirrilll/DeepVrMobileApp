import 'package:deepvr/booking_page_widgets/booking_step_layout.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_container.dart';
import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';
import '../../../providers/refactor/booking_model.dart';

class TimePickerPage extends StatelessWidget {
  const TimePickerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingModel>(),
      child:  BookingStepLayout(
                stepNumber: 5,
                content: Selector<BookingModel, DateEntity?>(
                    selector: (context, model) => model.booking.selectedDate ,
                    builder: (context, selectedDate, _) => selectedDate != null
                        ? TimePickerContainer(avaliblesTime: selectedDate.availableTime)
                        : const Center(child: CircularProgressIndicator())
                ),
                stepTitle: 'Выберите подходящее время'),
      );
  }
}


