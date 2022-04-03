import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/providers/booking_provider.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimePickerItem extends StatelessWidget {
  const TimePickerItem({Key? key, this.isBooked = false, required this.time})
      : super(key: key);

  final bool isBooked;
  final TimeEntity time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          !isBooked ? '' : 'Забронировано',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(height: 12),
        Consumer<TimeViewModel>(
          builder: (context, viewModel, _) => (ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.secondaryContainer,
                onSurface: const Color(0xFF0F0F1D),
                elevation: 20,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: viewModel.selectedTime != null && viewModel.selectedTime == time
                        ? const BorderSide(color: Color(0XFF8556FF), width: 2)
                        : BorderSide.none
                )),
            onPressed: isBooked
                ? null
                : () => viewModel.selectTime(time),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.access_time,
                  size: 20,
                  color: isBooked
                      ? const Color(0xFF58597B)
                      : Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 10),
                Text(
                  time.time.toString(),
                  style: TextStyle(
                      color: isBooked
                          ? const Color(0xFF58597B)
                          : Theme.of(context).colorScheme.secondary,
                      fontSize: 16),
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
