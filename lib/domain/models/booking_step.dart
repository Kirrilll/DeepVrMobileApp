import 'package:deepvr/domain/models/booking.dart';
import 'package:deepvr/domain/view_models/base_booking_step_model.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:flutter/cupertino.dart';

class BookingStep{
  Widget content;
  bool isControlPanelShow;
  bool isHeaderShow;
  bool Function(Booking model) isFinished;

  BookingStep(this.content, this.isControlPanelShow, this.isHeaderShow, this.isFinished);
  BookingStep.last({required this.content, required this.isFinished, this.isControlPanelShow = false, this.isHeaderShow = false});
  BookingStep.standard({required this.content, required this.isFinished, this.isHeaderShow = true, this.isControlPanelShow = true});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingStep &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          isControlPanelShow == other.isControlPanelShow &&
          isHeaderShow == other.isHeaderShow;

  @override
  int get hashCode =>
      content.hashCode ^
      isControlPanelShow.hashCode ^
      isHeaderShow.hashCode;
}