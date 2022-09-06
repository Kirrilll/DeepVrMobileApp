import 'package:deepvr/core/usecases/special_types/fetching_item.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/achievements/data/entities/achievement.dart';
import 'package:deepvr/features/achievements/data/repositories/achievement_repository.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/domain/locator.dart';

class AchievementModel with ChangeNotifier{
  final AchievementRepository _achievementRepository = AchievementRepository();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  FetchingItem<List<Achievement>> _state = FetchingItem(fetchingState: FetchingState.idle);

  AchievementModel(){
    _loadAchievements();
  }

  FetchingState get fetchingStatus => _state.fetchingState;
  List<Achievement> get allAchievements => _state.item!;
  List<Achievement> get userAchievements => _state.item!
      .where((achievement) => achievement.isReceived)
      .toList();

  Future<void> _loadAchievements({bool isRefresh = false}) async {
    if(!isRefresh){
      _updateState(_state.copyWith(fetchingState: FetchingState.loading));
    }
    final res = await _achievementRepository.getAchievements();
    _updateState(_state.copyWith(
      fetchingState: FetchingState.successful,
      item: res
    ));
  }

  void _updateState(FetchingItem<List<Achievement>> newState){
    _state = newState;
    notifyListeners();
  }

}