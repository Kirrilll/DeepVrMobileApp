import 'package:deepvr/entities/date_entity.dart';
import 'package:deepvr/providers/base_booking_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class DateViewModel with ChangeNotifier implements BaseBookingViewModel{

  DateEntity? _selectedDate;



  @override
  BaseBookingViewModel? getNext() {
    // TODO: implement getNext
    throw UnimplementedError();
  }

  @override
  BaseBookingViewModel? getPrev() {
    // TODO: implement getPrev
    throw UnimplementedError();
  }

  @override
  bool isFinished() {
    // TODO: implement isFinished
    throw UnimplementedError();
  }

}