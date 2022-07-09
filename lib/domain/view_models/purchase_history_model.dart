import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';

import '../../usecases/mappers/purchase_mapper.dart';
import '../models/purchase.dart';
import '../enums/fetching_state.dart';

class PurchaseHistoryModel with ChangeNotifier {
  late List<Purchase> _purchaseHistory;
  final ProfileService _profileService = locator<ProfileService>();
  final PurchaseMapper _purchaseMapper = locator<PurchaseMapper>();
  final AuthenticationModel _authenticationModel =
      locator<AuthenticationModel>();
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
          .map((purchase) => _purchaseMapper.toEntity(purchase))
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
