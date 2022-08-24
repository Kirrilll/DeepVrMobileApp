import 'package:deepvr/features/profile/data/repositories/profile_repository.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/core/domain/locator.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/usecases/mappers/purchase_mapper.dart';
import '../../../../domain/models/purchase.dart';
import '../../../../core/usecases/special_types/fetching_state.dart';

class PurchaseHistoryModel with ChangeNotifier {
  late List<Purchase> _purchaseHistory;
  final ProfileRepository _profileService = locator<ProfileRepository>();
  final PurchaseMapper _purchaseMapper = locator<PurchaseMapper>();
  final AuthenticationService _authenticationModel =
      locator<AuthenticationService>();
  FetchingState _fetchingStatus = FetchingState.idle;
  bool _isSortedEsc = true;

  List<Purchase> get purchaseHistory =>
      _isSortedEsc ? _purchaseHistory : _purchaseHistory.reversed.toList();
  List<Purchase> get smallPurchaseHistory => _purchaseHistory.take(3).toList();
  FetchingState get fetchingStatus => _fetchingStatus;
  bool get isSortedDesc => !_isSortedEsc;

  void setState(FetchingState state) {
    _fetchingStatus = state;
    notifyListeners();
  }

  Future<void> getPurchaseHistory() async {
    setState(FetchingState.loading);
    final response = await _profileService
        .getPurchaseHistory(_authenticationModel.user.token!);
    if (response != null && response.error == 0) {
      if (!_purchaseMapper.isInit) {
        await _purchaseMapper.init();
      }
      _purchaseHistory = response.response!
          .map((purchase) =>  _purchaseMapper.toEntity(purchase))
          .toList()
        ..sort((prev, next) => prev.date.compareTo(next.date));
      setState(FetchingState.successful);
    } else {
      setState(FetchingState.error);
    }
  }

  void setSorted() {
    _isSortedEsc = !_isSortedEsc;
    notifyListeners();
  }
}
