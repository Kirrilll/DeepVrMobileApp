import 'package:deepvr/features/booking/domain/view_models/time_model.dart';
import 'package:deepvr/features/booking/ui/templates/booking_step_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/locator.dart';
import '../widgets/time_item.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<TimeModel>(),
      child: BookingStepTemplate(
          stepNumber: 5,
          content: Consumer<TimeModel>(
              builder: (context, model, _) => Align(
                    alignment: Alignment.topCenter,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 162,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                            childAspectRatio: 3
                      ),
                      children: model.availableTime
                          .map((time) => TimeItem(time: time))
                          .toList(),
                      // child: SingleChildScrollView(
                      //   child: Wrap(
                      //     spacing: 16,
                      //     runSpacing: 16,
                      //     children: model.availableTime
                      //         .map((time) => SizedBox(
                      //               child: TimeItem(time: time),
                      //               height: 52,
                      //               width: 162,
                      //             ))
                      //         .toList(),
                      //   ),
                    ),
                  )),
          stepTitle: 'Выберите подходящее время'),
    );
  }
}
