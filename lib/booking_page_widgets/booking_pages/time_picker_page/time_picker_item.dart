import 'package:deepvr/entities/time_entity.dart';
import 'package:deepvr/models/refactor/booking.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimePickerItem extends StatelessWidget {
  const TimePickerItem({Key? key, required this.time}) : super(key: key);

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
                      const  AssetImage('assets/icons/access_time .png'),
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
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}
