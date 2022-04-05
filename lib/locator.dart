import 'package:deepvr/providers/app_model.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup(){
  locator.registerSingleton(GamesProvider()..getGames());
  locator.registerSingleton<GameTypeViewModel>(GameTypeViewModel());
  locator.registerSingleton<GamesViewModel>(GamesViewModel());
  locator.registerSingleton(CounterViewModel());
  locator.registerSingleton(DateViewModel());
  locator.registerSingleton( TimeViewModel());
  locator.registerSingleton(BookingFormViewModel());
  //Сделать это StreamProvider и вписыыывать туда значения сразу
  locator.registerSingleton(BookingResultsViewModel());
  locator.registerSingleton(BookingPageModel());
  locator.registerSingleton(AppModel());
}