import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/booking.dart';
import '../../domain/models/time.dart';
import '../../domain/view_models/booking_model.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({Key? key, required this.time}) : super(key: key);

  final Time time;

  @override
  Widget build(BuildContext context) {
    return Selector<BookingModel, Time?>(
        selector: (_, model) => model.selectedTime,
        shouldRebuild: (prev, next) => prev == time || next == time,
        builder: (context, selectedTime, _) =>
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: time == selectedTime
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.secondaryContainer,
                    elevation: 20,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => locator<BookingModel>().selectedTime = time,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/icons/access_time .png'),
                      size: 20,
                      color: time == selectedTime
                          ? const Color(0xFF050411)
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      time.time.toString(),
                      style: TextStyle(
                          color: time == selectedTime
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