import 'package:deepvr/domain/view_models/identification_model.dart';
import 'package:deepvr/providers/routes_model.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<RemoteService>(
      RemoteService(),
    signalsReady: true
  );

  locator.registerFactory(() => IdentificationModel());

  locator.registerLazySingleton(() => GamesProvider());
  //начало рефакторинга
  locator.registerLazySingleton(() => BookingModel());

  //конец рефакторига
  locator.registerLazySingleton(() =>
      GameTypeViewModel()); //сделать factory, что-то сделать с getNext и т.д
  locator.registerLazySingleton<GamesViewModel>(() => GamesViewModel());
  locator.registerLazySingleton(() => CounterViewModel());
  locator.registerLazySingleton(() => DateViewModel());
  locator.registerLazySingleton(() => TimeViewModel());
  locator.registerLazySingleton(() => BookingFormViewModel());
  //Сделать это StreamProvider и вписыыывать туда значения сразу
  locator.registerLazySingleton(() => BookingResultsViewModel());
  locator.registerSingleton(
      BookingPageModel()); //идеально сделать это factory, чтобы при каждом вызове обновлялось все
  locator.registerSingleton(RoutesModel());
}
