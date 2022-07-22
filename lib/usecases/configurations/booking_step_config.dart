
import 'package:deepvr/ui/screens/successful_screen.dart';
import 'package:deepvr/usecases/helpers/validation_helper.dart';

import '../../ui/screens/booking_result_screen.dart';
import '../../ui/screens/calendar_screen.dart';
import '../../ui/screens/personal_data_screen.dart';
import '../../ui/screens/game_page.dart';
import '../../ui/screens/game_type_screen.dart';
import '../../ui/screens/players_counter_screen.dart';
import '../../domain/models/booking_step.dart';
import '../../ui/screens/time_picker_screen.dart';


List<BookingStep> bookingSteps = [
  BookingStep.standard(content: const GameTypesPage(), isFinished: (booking) => booking.selectedType!=null),
  BookingStep.standard(content: const GameCardPage(), isFinished: (booking) => booking.selectedGame!= null),
  BookingStep.standard(content: const PlayersCounterPage(), isFinished: (booking) => booking.guestCount!=null),
  BookingStep.standard(content: const CalendarScreen(), isFinished: (booking) => booking.selectedDate!= null),
  BookingStep.standard(content: const TimeScreen(), isFinished: (booking) => booking.selectedTime!= null),
  BookingStep.standard(
      content: const PersonalDataScreen(),
      isFinished: (booking) => (booking.isAgree ?? false) &&
          ValidationHelper.validatePhone(booking.phone ?? '') == null &&
          (booking.name?.isNotEmpty ?? false)
  ),
  BookingStep(const BookingResultScreen(), true, false, (booking) => bookingSteps.sublist(0, bookingSteps.length-1)
      .map((step) => step.isFinished(booking))
      .reduce((value, element) => value && element),),
];

class StepsSelector {
  static BookingStep get gameType => bookingSteps[0];
  static BookingStep get games => bookingSteps[1];
  static BookingStep get counter => bookingSteps[2];
  static BookingStep get date => bookingSteps[3];
  static BookingStep get time => bookingSteps[4];
}