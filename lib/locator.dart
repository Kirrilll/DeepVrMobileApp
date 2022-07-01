import 'package:deepvr/data/services/authentication_service.dart';
import 'package:deepvr/data/services/games_service.dart';
import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/domain/view_models/identification_routing_model.dart';
import 'package:deepvr/domain/view_models/login_model.dart';
import 'package:deepvr/domain/view_models/profile_model.dart';
import 'package:deepvr/domain/view_models/registration_model.dart';
import 'package:deepvr/providers/routes_model.dart';
import 'package:deepvr/providers/booking_form_view_model.dart';
import 'package:deepvr/providers/booking_page_model.dart';
import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/date_view_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/domain/view_models/games_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:deepvr/providers/time_view_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/data/services/storge_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingletonAsync(() => StorageService().init());
  locator.registerSingleton<BookingService>(BookingService(),
      signalsReady: true);

  //Аунтефикация
  locator.registerSingleton(AuthenticationModel());
  locator.registerSingletonWithDependencies(() => IdentificationRoutingModel(),
      dependsOn: [StorageService]);

  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerFactory(() => RegistrationModel());
  locator.registerFactory(() => LoginModel());

  //Профиль
  locator.registerLazySingleton(() => ProfileService());
  locator.registerLazySingleton(() => ProfileModel()
    ..getBonuses()
    ..getPurchaseHistory());

  //Игры
  locator.registerLazySingleton(() => GamesService());
  //Бронирование
  locator.registerLazySingleton(() => GamesModel()..getGames());
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
