import 'dart:developer';

import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/booking/domain/view_models/calendar_model.dart';
import 'package:deepvr/features/booking/ui/templates/booking_step_template.dart';
import 'package:deepvr/features/booking/ui/widgets/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/locator.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalendarModel>.value(
              value: locator<CalendarModel>(),
              child: Consumer<CalendarModel>(
                  builder: (_, model, __) {
                return BookingStepTemplate(
                    stepNumber: 4,
                    content: Builder(
                      builder: (_) {
                        switch(model.fetchingStatus){
                          case FetchingState.successful:
                            return Calendar.fromModel(model: model);
                          case FetchingState.error:
                            return const Center(child: Text('ошибка'));
                          default:
                            return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    stepTitle: 'Выберите дату');
              }),
            );
  }
}
