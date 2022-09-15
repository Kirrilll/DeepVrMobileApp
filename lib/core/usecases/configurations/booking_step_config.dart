import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/features/booking/domain/view_models/game_type_model.dart';
import 'package:deepvr/features/booking/domain/view_models/guest_count_model.dart';
import 'package:deepvr/features/booking/domain/view_models/personal_data_model.dart';
import 'package:deepvr/features/booking/domain/view_models/results_model.dart';
import 'package:deepvr/features/booking/domain/view_models/time_model.dart';

import '../../../features/booking/domain/view_models/booking_games_model.dart';
import '../../../features/booking/domain/view_models/calendar_model.dart';
import '../../../features/booking/ui/screens/booking_result_screen.dart';
import '../../../features/booking/ui/screens/calendar_screen.dart';
import '../../../features/booking/ui/screens/game_page.dart';
import '../../../features/booking/ui/screens/game_type_screen.dart';
import '../../../features/booking/ui/screens/personal_data_screen.dart';
import '../../../features/booking/ui/screens/players_counter_screen.dart';
import '../../../domain/models/booking_step.dart';
import '../../../features/booking/ui/screens/time_picker_screen.dart';


class BookingConfiguration{
  final List<BookingStep> bookingSteps = [
    BookingStep.standard(content: const GameTypesPage(), viewModel: locator<GameTypeModel>()),
    BookingStep.standard(content: const GameCardPage(), viewModel: locator<BookingGamesModel>()),
    BookingStep.standard(content: const PlayersCounterPage(), viewModel: locator<GuestModel>()),
    BookingStep.standard(content: const CalendarScreen(), viewModel:  locator<CalendarModel>()),
    BookingStep.standard(content: const TimeScreen(), viewModel: locator<TimeModel>()),
    BookingStep.standard(content: const PersonalDataScreen(), viewModel:  locator<PersonalDataModel>()),
    BookingStep(const BookingResultScreen(), true, false, locator<ResultsModel>())
  ];
}

