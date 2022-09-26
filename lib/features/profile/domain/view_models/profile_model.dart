import 'package:deepvr/domain/models/profile_status.dart';
import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/models/bonus.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/core/di/locator.dart';
import 'package:deepvr/features/profile/domain/services/profile_service.dart';
import 'package:flutter/cupertino.dart';

//Сделать здесь загрузку всего
//Передавать через роут новую информацию
//???
class ProfileModel with ChangeNotifier{
  //FetchingState _profileFetchingStatus = FetchingState.idle;
  FetchingState _promoCodeActivationStatus = FetchingState.idle;
  String? _errorMessage;
  final ProfileService _profileService = locator<ProfileService>();
  final ProfileRepository _profileRepository = locator<ProfileRepository>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();


  ProfileModel(){
    _profileService.addListener(notifyListeners);
  }
  // List<Bonus> get bonuses => _bonuses!;
  // ProfileStatus get profileStatus => _profileStatus!;
  // String? get errorMessage => _errorMessage;
  // FetchingState get bonusesFetchingStatus => _profileFetchingStatus;
  // FetchingState get promoCodeActivationStatus => _promoCodeActivationStatus;

  List<Bonus> get bonuses => _profileService.profile.bonuses;
  ProfileStatus get profileStatus => _profileService.profile.status;
  String get errorMessage => _profileService.profileError;
  FetchingState get bonusesFetchingStatus => _profileService.profileStatus;
  FetchingState get promoCodeActivationStatus => _promoCodeActivationStatus;

  // void _setBonusesState(FetchingState state){
  //   _profileFetchingStatus = state;
  //   notifyListeners();
  // }

  void _setPromoCodeActivationState(FetchingState state){
    _promoCodeActivationStatus = state;
    notifyListeners();
  }

  Future<void> getBonuses() async{
    //_setBonusesState(FetchingState.loading);
    _profileService.getProfileStatus();
    // List<Bonus> bonuses = List.empty(growable: true);
    // ProfileStatus? profileStatus;
    // bool isShouldUpdate = false;
    // FetchingState finalState = FetchingState.successful;
    // if(_bonuses == null){
    //   _setBonusesState(FetchingState.loading);
    // }
    // final response =  await _profileRepository.getBonuses(_authenticationService.user.token!);
    // if(response!= null && response.error == 0) {
    //   bonuses.add(Bonus(title: 'Все', count: response.response!.quantityAll));
    //   bonuses.add(Bonus(title: 'Активные', count: response.response!.quantityReal));
    //   bonuses.add(Bonus(
    //       title: 'Временные',
    //       count: response.response!.quantityExpired,
    //       expiredDate: DateTime.tryParse(response.response!.nextExpiredDate ?? '')
    //   ));
    //   profileStatus = ProfileStatus.fromEntity(response.response!.loyaltyStatus);
    // }
    // else{
    //   isShouldUpdate = true;
    //   finalState = FetchingState.error;
    // }
    //
    // //TODO пофиксить здесь при выходе и повторном входе
    // bool isProfileUpdated = _profileStatus == null || (_profileStatus!= null && !_profileStatus!.equals(profileStatus));
    // bool isBonusesUpdated = _bonuses == null || (_bonuses!= null && Set.of(List.of(_bonuses!)..addAll(bonuses)).length != _bonuses!.length);
    //
    // if(isProfileUpdated) {
    //   _profileStatus = profileStatus;
    //   isShouldUpdate = true;
    // }
    // if(isBonusesUpdated){
    //   _bonuses = bonuses;
    //   isShouldUpdate = true;
    // }
    // if(isShouldUpdate){
    //   _setBonusesState(finalState);
    // }
  }

  Future<void> activatePromoCode(String promoCode) async {
    _setPromoCodeActivationState(FetchingState.loading);
    final response = await _profileRepository.activatePromo(_authenticationService.user.token!, promoCode);
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