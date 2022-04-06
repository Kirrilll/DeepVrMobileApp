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
  locator.registerLazySingleton<GameTypeViewModel>(() => GameTypeViewModel());
  locator.registerLazySingleton<GamesViewModel>(() => GamesViewModel());
  locator.registerLazySingleton(() => CounterViewModel());
  locator.registerLazySingleton(() => DateViewModel());
  locator.registerLazySingleton( () => TimeViewModel());
  locator.registerLazySingleton(() => BookingFormViewModel());
  //Сделать это StreamProvider и вписыыывать туда значения сразу
  locator.registerLazySingleton(() => BookingResultsViewModel());
  locator.registerSingleton(BookingPageModel());
  locator.registerSingleton(AppModel());
}