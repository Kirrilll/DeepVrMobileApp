import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/providers/booking_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatePickerItem extends StatelessWidget {
  DatePickerItem({
    Key? key,
    required this.dateEntity,
  }) : super(key: key);

  final DateEntity dateEntity;


  bool isFree = false;
  bool isCurrDay = false;



  BoxDecoration _buildBoxDecoration() {
    BoxDecoration boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1F2032));
    if (!isFree) {
      return boxDecoration.copyWith(color: const Color(0xFF0F0f1D));
    }
    if (isCurrDay) {
      return boxDecoration.copyWith(color: const Color(0xFFABAFE5));
    }
    return boxDecoration;
  }

  TextStyle _buildTextStyle() {
    TextStyle textStyle = const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white);

    if (!isFree) {
      return textStyle.copyWith(color: const Color(0xFF828188));
    }

    if (isCurrDay) {
      return textStyle.copyWith(color: const Color(0xFF191A29));
    }
    return textStyle;
  }

  //Здесь 3 состояния экрана,

  @override
  Widget build(BuildContext context) {
    
    var bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    
    return GestureDetector(
      onTap: () =>  bookingProvider.setSelectedDate(dateEntity),
      child: Container(
        padding: const EdgeInsets.all(6),
        width: 36,
        height: 36,
        decoration:  _buildBoxDecoration(),
        alignment: Alignment.topLeft,
        child: Text(
          dateEntity.date.day.toString(),
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: bookingProvider.selectedDate == dateEntity? Colors.white: const Color(0xFF828188)
          ),
        ),
      ),
    );
  }
}
