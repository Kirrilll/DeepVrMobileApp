import 'package:deepvr/core/domain/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/booking.dart';
import '../../../../domain/models/time.dart';
import '../../../../domain/view_models/booking_model.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({Key? key, required this.time}) : super(key: key);

  final Time time;

  @override
  Widget build(BuildContext context) {
    return Selector<BookingModel, Time?>(
        selector: (_, model) => model.selectedTime,
        shouldRebuild: (prev, next) => prev == time || next == time,
        builder: (context, selectedTime, _) =>
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: ImageIcon(
                        const AssetImage('assets/icons/access_time .png'),
                       // size: 20,
                        color: time == selectedTime
                            ? const Color(0xFF050411)
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Expanded(
                    flex: 24,
                    child: Text(
                      time.time.toString(),
                      style: TextStyle(
                          color: time == selectedTime
                              ? const Color(0xFF050411)
                              : Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ));
  }
}