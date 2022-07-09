import 'package:deepvr/data/entities/default_response.dart';
import 'package:deepvr/data/entities/loyalty_status.dart';
import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/profile_status.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';

class ProfileStatusesModel with ChangeNotifier{
  List<ProfileStatus> _statuses = List.empty(growable: true);
  FetchingState _fetchingStatus = FetchingState.idle;
  final ProfileService _profileService = locator<ProfileService>();
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