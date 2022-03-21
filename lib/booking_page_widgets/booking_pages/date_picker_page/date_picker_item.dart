import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle _buildTextStyle(bool isFree, bool isCurrDay) {
  TextStyle textStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 20,
      color: Colors.white);

  if (!isFree) {
    return textStyle.copyWith(color: const Color(0xFF828188));
  }

  if (isCurrDay) {
    return textStyle.copyWith(color: const Color(0xFF191A29));
  }
  return textStyle;
}

class DatePickerItem extends StatelessWidget {
  const DatePickerItem(
      {Key? key,
      required this.day,
      required this.setDay,
      required this.isFree,
      required this.isCurrDay})
      : super(key: key);

  final void Function() setDay;
  final int day;
  final bool isFree;
  final bool isCurrDay;

  BoxDecoration _buildBoxDecoration(isFree, isCurrDay) {
    BoxDecoration boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1F2032)
    );
    if(!isFree){
      return boxDecoration.copyWith(
        color: const Color(0xFF0F0f1D)
      );
    }
    if(isCurrDay){
      return boxDecoration.copyWith(
        color: const Color(0xFFABAFE5)
      );
    }
    return boxDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: _buildBoxDecoration(isFree, isCurrDay),
      alignment: Alignment.topLeft,
      child: Text(
        day.toString(),
        style: _buildTextStyle(isFree, isCurrDay),
      ),
    );
  }
}
