
import 'package:flutter/material.dart';

import '../../booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import '../../booking_page_widgets/booking_pages/form_page/form_page.dart';
import '../../booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import '../../booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import '../../booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import '../../booking_page_widgets/booking_pages/result_page/result_page.dart';
import '../../models/booking_step.dart';
import '../../ui/screens/time_picker_step.dart';


List<BookingStep> bookingSteps = [
  BookingStep.standard(content: const GameTypesPage(), isFinished: (booking) => booking.selectedType !=null ),
  BookingStep.standard(content:  GameCardPage(), isFinished: (booking) => booking.selectedGame != null),
  BookingStep.standard(content: const PlayersCounterPage(), isFinished: (booking) => booking.guestCount != null),
  BookingStep.standard(content: const DatePickerPage(), isFinished: (booking) => booking.selectedDate != null),
  BookingStep.standard(content: const TimePickerStep(), isFinished: (booking) => booking.selectedTime != null),
  BookingStep.standard(content: const FormPage(), isFinished: (booking) => booking.name != null && booking.phone != null),
  BookingStep(const BookingResultPage(), true, false, (sd) => true,),
  BookingStep.last(content: const Center(child: Text('Ждем')), isFinished: (sa) => true)
];

class StepsSelector {
  static BookingStep get gameType => bookingSteps[0];
  static BookingStep get games => bookingSteps[1];
  static BookingStep get counter => bookingSteps[2];
  static BookingStep get date => bookingSteps[3];
  static BookingStep get time => bookingSteps[4];
}