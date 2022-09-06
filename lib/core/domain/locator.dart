import 'package:deepvr/core/routing/guards/route_duplicate_guard.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:deepvr/features/achievements/domain/view_models/achievement_model.dart';
import 'package:deepvr/features/authentication/data/repositories/authentication_repository.dart';
import 'package:deepvr/features/authentication/domain/view_models/authentication_model.dart';
import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/domain/view_models/game_types_model.dart';
import 'package:deepvr/features/authentication/domain/view_models/login_model.dart';
import 'package:deepvr/features/profile/domain/view_models/profile_model.dart';
import 'package:deepvr/features/profile/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/features/authentication/domain/view_models/registration_model.dart';
import 'package:deepvr/features/profile/domain/view_models/statuses_model.dart';
import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:deepvr/features/games/domain/view_models/games_model.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/features/booking/data/repositories/booking_repository.dart';
import 'package:deepvr/core/usecases/utils/scale_util.dart';
import 'package:deepvr/core/usecases/helpers/booking_helper.dart';
import 'package:deepvr/core/usecases/mappers/purchase_mapper.dart';
import 'package:get_it/get_it.dart';

import '../../domain/view_models/calendar_model.dart';
import '../../features/local_storage/services/storge_service.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton(ScaleUtil());
  locator.registerSingletonAsync(() => StorageService().init());
  locator.registerSingleton<BookingRepository>(BookingRepository(), signalsReady: true);

  //Аунтефикация
  locator.registerSingletonAsync(() => AuthenticationService().init(), dependsOn: [StorageService]);
  locator.registerSingletonWithDependencies(() => AuthenticationModel(), dependsOn: [AuthenticationService]);
  locator.registerLazySingleton(() => AuthenticationRepository());
  locator.registerFactory(() => RegistrationModel());
  locator.registerFactory(() => LoginModel());

  //Профиль
  locator.registerLazySingleton(() => ProfileRepository());
  locator.registerSingletonWithDependencies(() => ProfileModel(), dependsOn: [AuthenticationService]);
  locator.registerSingletonWithDependencies(() => PurchaseHistoryModel(), dependsOn: [AuthenticationService]);
  locator.registerSingletonWithDependencies(() => ProfileStatusesModel(), dependsOn: [AuthenticationService]);
  locator.registerLazySingleton(() => PurchaseMapper());

  //Игры
  locator.registerLazySingleton(() => GamesModel());
  locator.registerLazySingleton(() => GamesService());

  //Бронирование
  locator.registerSingletonWithDependencies(() => BookingModel(), dependsOn: [AuthenticationService]);
  locator.registerLazySingleton(() => BookingHelper());
  locator.registerLazySingleton(() => GameTypeModel()..getGameTypes());
  locator.registerLazySingleton(() => CalendarModel());
  locator.registerLazySingleton(() => BookingGamesModel());

  //Достижения
  locator.registerLazySingleton(() => AchievementModel());

  //Навигация
  locator.registerSingleton(AppRouter(
      routeDuplicateGuard: RouteDuplicateGuard(),
  )
  );
}
