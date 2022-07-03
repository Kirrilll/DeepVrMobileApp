import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/entities/date_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../entities/time_entity.dart';
import '../../locator.dart';
import '../../models/refactor/booking.dart';
import '../../providers/refactor/booking_model.dart';

class TimePickerStep extends StatelessWidget {
  const TimePickerStep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingModel>(),
      child: BookingStepTemplate(
          stepNumber: 5,
          content: Selector<BookingModel, DateEntity?>(
              selector: (context, model) => model.booking.selectedDate,
              builder: (context, selectedDate, _) => selectedDate != null
                  ? TimeContainer(availableTime: selectedDate.availableTime)
                  : const Center(child: CircularProgressIndicator())),
          stepTitle: 'Выберите подходящее время'),
    );
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({Key? key, required this.availableTime})
      : super(key: key);

  final List<TimeEntity> availableTime;

  //В теории данные приходят сюда
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 85,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemCount: availableTime.length,
        itemBuilder: (context, index) => TimeItem(time: availableTime[index]));
  }
}

class TimeItem extends StatelessWidget {
  const TimeItem({Key? key, required this.time}) : super(key: key);

  final TimeEntity time;

  bool _isSelected(TimeEntity? time) => this.time == time;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingModel>(
        builder: (context, viewModel, _) =>
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: _isSelected(viewModel.booking.selectedTime)
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.secondaryContainer,
                    elevation: 20,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => viewModel.updateBooking(
                    Booking.copyWith(viewModel.booking, selectedTime: time)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/icons/access_time .png'),
                      size: 20,
                      color: _isSelected(viewModel.booking.selectedTime)
                          ? const Color(0xFF050411)
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      time.time.toString(),
                      style: TextStyle(
                          color: _isSelected(viewModel.booking.selectedTime)
                              ? const Color(0xFF050411)
                              : Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ]));
  }
}
