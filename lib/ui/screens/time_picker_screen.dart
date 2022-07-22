import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/domain/models/date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/view_models/booking_model.dart';
import '../widgets/time_item.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BookingStepTemplate(
          stepNumber: 5,
          content: Selector<BookingModel, Date?>(
              selector: (context, model) => model.selectedDate,
              builder: (context, selectedDate, _) => selectedDate != null
                  ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 85,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemCount: selectedDate.availableTime.length,
                  itemBuilder: (context, index) => TimeItem(time: selectedDate.availableTime[index]))
                  : const Center(child: CircularProgressIndicator())),
          stepTitle: 'Выберите подходящее время');
  }
}

