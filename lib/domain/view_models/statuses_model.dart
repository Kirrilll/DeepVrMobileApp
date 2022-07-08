import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/profile_status.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';

class ProfileStatusesModel with ChangeNotifier{
  final List<ProfileStatus> _statuses = List.empty(growable: true);
  FetchingState _allStatusesFetchingStatus = FetchingState.idle;
  FetchingState _userStatusFetching = FetchingState.idle;
  final ProfileService _profileService = locator<ProfileService>();
  int? _userStatusId;


  List<ProfileStatus> get statuses => _statuses;
  FetchingState get allStatusesFetchingStatus => _allStatusesFetchingStatus;
  FetchingState get userStatusFetchingState{
    if(_allStatusesFetchingStatus == FetchingState.successful && _userStatusFetching == FetchingState.successful) {
      return FetchingState.successful;
    }
    return FetchingState.loading;
  }
  ProfileStatus get userStatus => _statuses.firstWhere((status) => status.id == _userStatusId);

  setAllStatusState(FetchingState status){
    _allStatusesFetchingStatus = status;
    notifyListeners();
  }

  setUserStatusState(FetchingState status){
    _userStatusFetching = status;
    notifyListeners();
  }

  Future<void> getStatuses() async {
    setAllStatusState(FetchingState.loading);

    await _profileService.getStatusesList();
    final result = await Future.delayed(const Duration(seconds: 1), () => [
      ProfileStatus(id: 1, imgPath: 'assets/images/status.png', title: 'Новичок', bonusPercent: 5),
      ProfileStatus(id: 2, imgPath: 'assets/images/status.png', title: 'Игроман', bonusPercent: 10),
      ProfileStatus(id: 3, imgPath: 'assets/images/status.png', title: 'Профи', bonusPercent: 15)
    ]);
    _statuses.addAll(result);
    setAllStatusState(FetchingState.successful);
  }

  Future<void> getUserStatus() async{
    if(_userStatusId == null){
      setUserStatusState(FetchingState.loading);
    }
    final result = await Future.delayed(const Duration(milliseconds: 500), () => 1);
    if(result != _userStatusId){
      _userStatusId = result;
      setUserStatusState(FetchingState.successful);
    }
  }

}