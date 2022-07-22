import 'dart:developer';

import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/calendar_model.dart';
import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/ui/widgets/calendar.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/usecases/helpers/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  //Возможно стоит пустить здесь Stream и из него данные получать
  @override
  Widget build(BuildContext context) {
    return Selector<BookingModel, Tuple<int?, int?>>(
      selector: (_, model) => Tuple(
          item1: model.selectedGame?.id,
          item2: model.guestCount),
      builder: (_, tuple, __) => tuple.item2 != null && tuple.item1 != null
          ? ChangeNotifierProvider.value(
              value: locator<CalendarModel>()..getCalendar(tuple.item1!, tuple.item2!),
              child: Consumer<CalendarModel>(builder: (_, model, __) {
                return BookingStepTemplate(
                    stepNumber: 4,
                    content: Builder(
                      builder: (_) {
                        switch(model.fetchingStatus){
                          case FetchingState.successful:
                            return Calendar(months: model.months);
                          case FetchingState.error:
                            return const Center(child: Text('ошибка'));
                          default:
                            return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    stepTitle: 'Выберите дату');
              }),
            )
          : const SizedBox(),
    );
  }
}
