import 'package:deepvr/core/di/locator.dart';
import 'package:deepvr/domain/models/date.dart';
import 'package:deepvr/features/booking/domain/view_models/calendar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DateItem extends StatelessWidget {
  const DateItem({Key? key, this.isEmpty = false, required this.date}) : super(key: key);

  const DateItem.empty({Key? key, this.isEmpty = true, this.date}) : super(key: key);

  final bool isEmpty;
  final Date? date;

  Color _buildBackgroundColor() {
    if (date!.date.day == DateTime.now().day &&
        date!.date.month == DateTime.now().month) {
      return const Color(0xFFABAFE5);
    }
    return const Color(0xFF1F2032);
  }

  TextStyle _buildTextStyle() {
    TextStyle textStyle = const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white);

    if (date!.availableTime.isEmpty) {
      return textStyle.copyWith(color: const Color(0xFF828188));
    }

    if (date!.date.day == DateTime.now().day &&
        date!.date.month == DateTime.now().month) {
      return textStyle.copyWith(color: const Color(0xFF191A29));
    }
    return textStyle;
  }

  @override
  Widget build(BuildContext context) {
    return !isEmpty
        ? Selector<CalendarModel, Date?>(
            selector: (_, model) => model.selectedDate,
            shouldRebuild: (prev, next) => next == date || prev == date,
            builder: (context, selectedDate, _) => ElevatedButton(
                onPressed: date!.availableTime.isNotEmpty
                    ? () => locator<CalendarModel>().setDate(date)
                    : null,
                style: ElevatedButton.styleFrom(
                    primary: _buildBackgroundColor(),
                    onSurface: const Color(0xFF0F0f1D),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(6),
                    //fixedSize: const Size(43, 43),
                    shape: null,
                    side: selectedDate != null && selectedDate == date
                        ? const BorderSide(color: Color(0XFF8556FF), width: 2)
                        : BorderSide.none),
                child:
                Text(
                  date!.date.day.toString(),
                  style: _buildTextStyle(),
                )),
          )
        : const SizedBox(
            height: 43,
            width: 43,
          );
  }
}
