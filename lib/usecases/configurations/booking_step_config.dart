
import 'package:deepvr/domain/view_models/calendar_model.dart';
import 'package:deepvr/domain/view_models/booking_games_model.dart';
import 'package:deepvr/domain/view_models/game_types_model.dart';
import 'package:deepvr/domain/view_models/players_counter_model.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/material.dart';

import '../../domain/view_models/calendar_model.dart';
import '../../ui/screens/calendar_screen.dart';
import '../../booking_page_widgets/booking_pages/form_page/form_page.dart';
import '../../ui/screens/game_page.dart';
import '../../domain/view_models/game_types_model.dart';
import '../../ui/screens/game_type_screen.dart';
import '../../ui/screens/players_counter_screen.dart';
import '../../booking_page_widgets/booking_pages/result_page/result_page.dart';
import '../../domain/models/booking_step.dart';
import '../../ui/screens/time_picker_step.dart';


List<BookingStep> bookingSteps = [
  BookingStep.standard(content: const GameTypesPage(), viewModel: locator<GameTypeModel>()),
  BookingStep.standard(content:  GameCardPage(), viewModel: locator<BookingGamesModel>()),
  BookingStep.standard(content: const PlayersCounterPage(), viewModel: locator<PlayerCounterModel>()),
  BookingStep.standard(content: const CalendarScreen(), viewModel: locator<CalendarModel>()),
  // BookingStep.standard(content: const TimePickerStep(), isFinished: (booking) => booking.selectedTime != null),
  // BookingStep.standard(content: const FormPage(), isFinished: (booking) => booking.name != null && booking.phone != null),
  // BookingStep(const BookingResultPage(), true, false, (sd) => true,),
  // BookingStep.last(content: const Center(child: Text('Ждем')), isFinished: (sa) => true)
];

class StepsSelector {
  static BookingStep get gameType => bookingSteps[0];
  static BookingStep get games => bookingSteps[1];
  static BookingStep get counter => bookingSteps[2];
  static BookingStep get date => bookingSteps[3];
  static BookingStep get time => bookingSteps[4];
}