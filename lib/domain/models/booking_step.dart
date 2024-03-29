import 'package:flutter/cupertino.dart';

import '../../features/booking/usecases/interfaces/i_booking_model.dart';

class BookingStep{
  Widget content;
  bool isControlPanelShow;
  bool isHeaderShow;
  IBookingModel viewModel;

  BookingStep(this.content, this.isControlPanelShow, this.isHeaderShow, this.viewModel);
  BookingStep.last({required this.content, required this.viewModel, this.isControlPanelShow = false, this.isHeaderShow = false});
  BookingStep.standard({required this.content, required this.viewModel, this.isHeaderShow = true, this.isControlPanelShow = true});

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