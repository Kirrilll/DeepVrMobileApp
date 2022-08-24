import 'package:deepvr/domain/models/profile_status.dart';
import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/models/bonus.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/core/domain/locator.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel with ChangeNotifier{
  List<Bonus>? _bonuses;
  ProfileStatus? _profileStatus;
  FetchingState _profileFetchingStatus = FetchingState.idle;
  FetchingState _promoCodeActivationStatus = FetchingState.idle;
  String? _errorMessage;
  final ProfileRepository _profileService = locator<ProfileRepository>();
  final AuthenticationService _authenticationModel = locator<AuthenticationService>();


  List<Bonus> get bonuses => _bonuses!;
  ProfileStatus get profileStatus => _profileStatus!;
  String? get errorMessage => _errorMessage;
  FetchingState get bonusesFetchingStatus => _profileFetchingStatus;
  FetchingState get promoCodeActivationStatus => _promoCodeActivationStatus;

  void _setBonusesState(FetchingState state){
    _profileFetchingStatus = state;
    notifyListeners();
  }

  void _setPromoCodeActivationState(FetchingState state){
    _promoCodeActivationStatus = state;
    notifyListeners();
  }

  Future<void> getBonuses() async{
    List<Bonus> bonuses = List.empty(growable: true);
    ProfileStatus? profileStatus;
    bool isShouldUpdate = false;
    FetchingState finalState = FetchingState.successful;
    if(_bonuses == null){
      _setBonusesState(FetchingState.loading);
    }
    final response =  await _profileService.getBonuses(_authenticationModel.user.token!);

    if(response!= null && response.error == 0) {
      bonuses.add(Bonus(title: 'Все', count: response.response!.quantityAll));
      bonuses.add(Bonus(title: 'Активные', count: response.response!.quantityReal));
      bonuses.add(Bonus(
          title: 'Временные',
          count: response.response!.quantityExpired,
          expiredDate: DateTime.tryParse(response.response!.nextExpiredDate ?? '')
      ));
      profileStatus = ProfileStatus.fromEntity(response.response!.loyaltyStatus);
    }
    else{
      isShouldUpdate = true;
      finalState = FetchingState.error;
    }

    //TODO пофиксить здесь при выходе и повторном входе
    bool isProfileUpdated = _profileStatus == null || (_profileStatus!= null && !_profileStatus!.equals(profileStatus));
    bool isBonusesUpdated = _bonuses == null || (_bonuses!= null && Set.of(List.of(_bonuses!)..addAll(bonuses)).length != _bonuses!.length);

    if(isProfileUpdated) {
      _profileStatus = profileStatus;
      isShouldUpdate = true;
    }
    if(isBonusesUpdated){
      _bonuses = bonuses;
      isShouldUpdate = true;
    }
    if(isShouldUpdate){
      _setBonusesState(finalState);
    }
  }

  Future<void> activatePromoCode(String promoCode) async {
    _setPromoCodeActivationState(FetchingState.loading);
    final response = await _profileService.activatePromo(_authenticationModel.user.token!, promoCode);
    if(response != null && response.error == 0){
      _setPromoCodeActivationState(FetchingState.successful);
      getBonuses();
    }
    else{
      _errorMessage = response?.message ?? 'Нет соединения';
      _setPromoCodeActivationState(FetchingState.error);
    }
  }

}