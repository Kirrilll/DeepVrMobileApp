import 'package:deepvr/data/services/authentication_service.dart';
import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/domain/view_models/game_types_model.dart';
import 'package:deepvr/domain/view_models/login_model.dart';
import 'package:deepvr/domain/view_models/profile_model.dart';
import 'package:deepvr/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/domain/view_models/registration_model.dart';
import 'package:deepvr/domain/view_models/statuses_model.dart';
import 'package:deepvr/domain/view_models/routes_model.dart';
import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:deepvr/features/games/domain/view_models/games_model.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/data/services/storge_service.dart';
import 'package:deepvr/usecases/helpers/booking_helper.dart';
import 'package:deepvr/usecases/mappers/purchase_mapper.dart';
import 'package:get_it/get_it.dart';

import 'domain/view_models/calendar_model.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingletonAsync(() => StorageService().init());
  locator.registerSingleton<BookingService>(BookingService(),
      signalsReady: true);

  //Аунтефикация
  locator.registerSingletonAsync(() => AuthenticationModel().init(), dependsOn: [StorageService]);
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerFactory(() => RegistrationModel());
  locator.registerFactory(() => LoginModel());

  //Профиль
  locator.registerLazySingleton(() => ProfileService());
  locator.registerSingletonWithDependencies(() => ProfileModel(), dependsOn: [AuthenticationModel]);
  locator.registerSingletonWithDependencies(() => PurchaseHistoryModel(), dependsOn: [AuthenticationModel]);
  locator.registerSingletonWithDependencies(() => ProfileStatusesModel(), dependsOn: [AuthenticationModel]);
  locator.registerLazySingleton(() => PurchaseMapper());

  //Игры
  locator.registerLazySingleton(() => GamesService());
  locator.registerLazySingleton(() => GamesModel()..getGames());


  //Бронирование
  locator.registerLazySingleton(() => BookingModel());
  locator.registerLazySingleton(() => BookingHelper());
  locator.registerLazySingleton(() => GameTypeModel()..getGameTypes());
  locator.registerLazySingleton(() => CalendarModel());
  locator.registerLazySingleton(() => BookingGamesModel());

  locator.registerSingleton(RoutesModel());
}
