import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../locator.dart';

class DateView extends StatelessWidget {
  DateView({Key? key, this.isEmpty = false, required this.date}): super(key: key);

  DateView.empty({Key? key, this.isEmpty = true, this.date}) : super(key: key);

  bool isEmpty;
  final DateEntity? date;

  Color _buildBackgroundColor() {
    if (date!.date.day == DateTime.now().day && date!.date.month == DateTime.now().month) {
      return const Color(0xFFABAFE5);
    }
    return const Color(0xFF1F2032);
  }

  TextStyle _buildTextStyle() {
    TextStyle textStyle = const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white);

    if (date!.availableTime.isEmpty) {
      return textStyle.copyWith(color: const Color(0xFF828188));
    }

    if (date!.date.day == DateTime.now().day && date!.date.month == DateTime.now().month) {
      return textStyle.copyWith(color: const Color(0xFF191A29));
    }
    return textStyle;
  }


  @override
  Widget build(BuildContext context) {
    return !isEmpty ? Consumer<DateViewModel>(
      builder: (context, model, _) => ElevatedButton(
        onPressed: date!.availableTime.isNotEmpty
            ? () => model.selectDate(date!)
            : null,
        style: ElevatedButton.styleFrom(
          primary: _buildBackgroundColor(),
          onSurface: const Color(0xFF0F0f1D),
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(6),
          fixedSize: const Size(43, 43),
          shape: null,
          side: model.selectedDate != null && model.selectedDate == date
            ? const BorderSide(color: Color(0XFF8556FF), width: 2)
              : BorderSide.none
        ),
        child: Text(
            date!.date.day.toString(),
          style: _buildTextStyle(),
        )
      ),
    )
    : const SizedBox(height: 43, width: 43,);
  }
}
