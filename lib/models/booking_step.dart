import 'package:deepvr/models/booking.dart';
import 'package:flutter/cupertino.dart';

class BookingStep{
  Widget content;
  bool isControlPanelShow;
  bool isHeaderShow;
  bool Function(Booking booking) isFinished;

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
          isHeaderShow == other.isHeaderShow &&
          isFinished == other.isFinished;

  @override
  int get hashCode =>
      content.hashCode ^
      isControlPanelShow.hashCode ^
      isHeaderShow.hashCode ^
      isFinished.hashCode;
}