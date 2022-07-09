import 'package:deepvr/data/entities/bonus_info.dart';
import 'package:deepvr/domain/models/purchase.dart';
import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/bonus.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel with ChangeNotifier{
  late List<Bonus> _bonuses;
  FetchingState _bonusesFetchingStatus = FetchingState.idle;
  final ProfileService _profileService = locator<ProfileService>();
  final AuthenticationModel _authenticationModel = locator<AuthenticationModel>();

  List<Bonus> get bonuses => _bonuses;
  FetchingState get bonusesFetchingStatus => _bonusesFetchingStatus;

  Future<void> getBonuses() async{
    _bonusesFetchingStatus = FetchingState.loading;
    final response =  await _profileService.getBonuses(_authenticationModel.user.token!);

    if(response!.error == 0) {
      List<Bonus> bonuses = List.empty(growable: true);
      bonuses.add(Bonus(title: 'Все', count: response.response!.quantityAll));
      bonuses.add(Bonus(title: 'Активные', count: response.response!.quantityReal));
      bonuses.add(Bonus(title: 'Временные', count: response.response!.quantityExpired));
      _bonuses = bonuses;
      _bonusesFetchingStatus = FetchingState.successful;
    }
    else{
      _bonusesFetchingStatus = FetchingState.error;
    }
    notifyListeners();

  }

}