import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/models/profile_status.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/di/locator.dart';

class ProfileStatusesModel with ChangeNotifier{
  List<ProfileStatus> _statuses = List.empty(growable: true);
  FetchingState _fetchingStatus = FetchingState.idle;
  final ProfileRepository _profileService = locator<ProfileRepository>();
  List<ProfileStatus> get statuses => _statuses;
  FetchingState get fetchingStatus => _fetchingStatus;

  setState(FetchingState status){
    _fetchingStatus = status;
    notifyListeners();
  }


  Future<void> getStatuses() async {
    setState(FetchingState.loading);
    final response = await _profileService.getStatusesList();
    _statuses = response?.response?.map((e) => ProfileStatus.fromEntity(e)).toList() ?? List.empty();
    setState(FetchingState.successful);
  }
}