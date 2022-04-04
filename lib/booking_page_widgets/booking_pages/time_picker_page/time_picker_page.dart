import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_container.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class TimePickerPage extends StatelessWidget {
  const TimePickerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<TimeViewModel>(),
      child:  BookingPageMaket(
                stepNumber: 5,
                content: Consumer<TimeViewModel>(
                    builder: (context, viewModel, _) => viewModel.isAvailable
                        ? TimePickerContainer(avaliblesTime: viewModel.availableTime)
                        : const Center(child: CircularProgressIndicator())
                ),
                stepTitle: 'Выберите подходящее время'),
      );
  }
}
