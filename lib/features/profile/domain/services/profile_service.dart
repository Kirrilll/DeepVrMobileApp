import 'package:deepvr/core/di/locator.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/features/profile/domain/entities/profile.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/usecases/mappers/purchase_mapper.dart';
import '../../../../domain/models/bonus.dart';
import '../../../../domain/models/profile_status.dart';
import '../../data/repositories/profile_repository.dart';

part '../entities/profile_service_state.dart';


class ProfileService with ChangeNotifier {
  _ProfileServiceState _state = _ProfileServiceState.initial();

  final _authenticationService = locator<AuthenticationService>();
  final _profileRepository = locator<ProfileRepository>();
  final _purchaseMapper = locator<PurchaseMapper>();

  ProfileService(){
    init();
    _authenticationService.addListener(init);
  }

  Profile get profile => _state.profile;
  FetchingState get profileStatus => _state.profileStatus;
  String get profileError => _state.profileError;
  FetchingState get purchaseHistoryStatus => _state.bonusesStatus;
  String get purchaseHistoryError => _state.bonusesError;
  bool get isAuthenticated => _authenticationService.isAuthenticated;

  void _setState(_ProfileServiceState state){
    _state = state;
    notifyListeners();
  }

  Future<void> init() async {
    if (_authenticationService.isAuthenticated) {
      await getProfileStatus();
      await getPurchaseHistory();
    }
    else{
      _setState(_ProfileServiceState.initial());
    }
  }

  Future<void> getProfileStatus() async {
    _setState(_state.copyWith(profileStatus: FetchingState.loading));
    final user = _authenticationService.user;
    final profileResponse = await _profileRepository.getBonuses(user.token!);
    if (profileResponse?.error != 0) {
      _setState(_state.copyWith(
          profileStatus: FetchingState.error,
          profileError: profileResponse?.message ?? 'Потеряно соединение')
      );
    }
    if (profileResponse?.response != null) {
      final bonusInfo = profileResponse!.response;
      _setState(_state.copyWith(
        profile: profile.copyWith(
            status: ProfileStatus.fromEntity(bonusInfo!.loyaltyStatus),
            user: user,
            bonuses: [
              Bonus(title: 'Все', count: bonusInfo.quantityAll),
              Bonus(title: 'Активные', count: bonusInfo.quantityReal),
              Bonus(title: 'Временные', count: bonusInfo.quantityExpired, expiredDate: DateTime.tryParse(bonusInfo.nextExpiredDate ?? ''))
            ]
        ),
        profileStatus:  FetchingState.successful)
      );
    }
  }

  Future<void> getPurchaseHistory() async {
    _setState(_state.copyWith(bonusesStatus: FetchingState.loading));
    final response = await _profileRepository.getPurchaseHistory(_authenticationService.user.token ?? '');
    if(response?.error != 0){
      _setState(_state.copyWith(
        bonusesStatus: FetchingState.error,
        bonusesError: response?.message ?? 'Потеряно соединение'
      ));
      return;
    }
    if(!_purchaseMapper.isInit){
      await _purchaseMapper.init();
    }
    _setState(_state.copyWith(
      bonusesStatus: FetchingState.successful,
      profile: profile.copyWith(
          purchaseHistory: response!.response!
              .map((purchase) =>  _purchaseMapper.toEntity(purchase))
              .toList()
            ..sort((prev, next) => prev.date.compareTo(next.date))
      )
    ));
  }
}
