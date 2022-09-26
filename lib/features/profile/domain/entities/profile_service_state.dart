part of '../services/profile_service.dart';

class _ProfileServiceState {
  final Profile _profile;
  final FetchingState _profileStatus;
  final String _profileError;
  final FetchingState _purchaseHistoryStatus;
  final String _purchaseHistoryError;


  Profile get profile => _profile;
  FetchingState get profileStatus => _profileStatus;
  String get profileError => _profileError;
  FetchingState get bonusesStatus => _purchaseHistoryStatus;
  String get bonusesError => _purchaseHistoryError;

  _ProfileServiceState.initial():
        _profile = Profile.unidentified(),
        _profileStatus = FetchingState.idle,
        _profileError = '',
        _purchaseHistoryStatus = FetchingState.idle,
        _purchaseHistoryError = '';

  const _ProfileServiceState({
    required Profile profile,
    required FetchingState profileStatus,
    required String profileError,
    required FetchingState bonusesStatus,
    required String bonusesError,
  })  : _profile = profile,
        _profileStatus = profileStatus,
        _profileError = profileError,
        _purchaseHistoryStatus = bonusesStatus,
        _purchaseHistoryError = bonusesError;


  _ProfileServiceState copyWith({
    Profile? profile,
    FetchingState? profileStatus,
    String? profileError,
    FetchingState? bonusesStatus,
    String? bonusesError,
  }) {
    return _ProfileServiceState(
      profile: profile ?? _profile,
      profileStatus: profileStatus ?? _profileStatus,
      profileError: profileError ?? _profileError,
      bonusesStatus: bonusesStatus ?? _purchaseHistoryStatus,
      bonusesError: bonusesError ?? _purchaseHistoryError,
    );
  }

}