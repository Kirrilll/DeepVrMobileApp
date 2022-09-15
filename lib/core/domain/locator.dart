import 'package:deepvr/core/routing/guards/route_duplicate_guard.dart';
import 'package:deepvr/core/routing/router/app_router.gr.dart';
import 'package:deepvr/core/usecases/configurations/booking_step_config.dart';
import 'package:deepvr/features/achievements/domain/view_models/achievement_model.dart';
import 'package:deepvr/features/authentication/data/repositories/authentication_repository.dart';
import 'package:deepvr/features/authentication/domain/view_models/authentication_model.dart';
import 'package:deepvr/features/booking/domain/services/booking_service.dart';
import 'package:deepvr/features/booking/domain/view_models/game_type_model.dart';
import 'package:deepvr/features/booking/domain/view_models/guest_count_model.dart';
import 'package:deepvr/features/booking/domain/view_models/personal_data_model.dart';
import 'package:deepvr/features/booking/domain/view_models/results_model.dart';
import 'package:deepvr/features/booking/domain/view_models/time_model.dart';
import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/features/authentication/domain/view_models/login_model.dart';
import 'package:deepvr/features/profile/domain/view_models/profile_model.dart';
import 'package:deepvr/features/profile/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/features/authentication/domain/view_models/registration_model.dart';
import 'package:deepvr/features/profile/domain/view_models/statuses_model.dart';
import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:deepvr/features/games/domain/view_models/games_model.dart';
import 'package:deepvr/features/booking/data/repositories/booking_repository.dart';
import 'package:deepvr/core/usecases/utils/scale_util.dart';
import 'package:deepvr/core/usecases/mappers/purchase_mapper.dart';
import 'package:get_it/get_it.dart';
import '../../features/booking/domain/view_models/calendar_model.dart';
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
  locator.registerLazySingleton(() => BookingService());
  //locator.registerLazySingleton(() => BookingHelper());
  locator.registerLazySingleton(() => GameTypeModel());
  locator.registerLazySingleton(() => TimeModel());
  locator.registerLazySingleton(() => GuestModel());
  locator.registerLazySingleton(() => BookingGamesModel());
  locator.registerLazySingleton(() => CalendarModel());
  locator.registerLazySingleton(() => PersonalDataModel());
  locator.registerLazySingleton(() => ResultsModel());
  locator.registerLazySingleton(() => BookingConfiguration());
  //Достижения
  locator.registerLazySingleton(() => AchievementModel());

  //Навигация
  locator.registerSingleton(AppRouter(
      routeDuplicateGuard: RouteDuplicateGuard(),
  )
  );
}
