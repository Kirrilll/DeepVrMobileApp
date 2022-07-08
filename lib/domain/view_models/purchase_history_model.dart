
import 'package:deepvr/data/services/profile_service.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';

import '../../data/entities/purchase.dart';
import '../enums/fetching_state.dart';

class PurchaseHistoryModel with ChangeNotifier{
  late List<Purchase> _purchaseHistory;
  final ProfileService _profileService = locator<ProfileService>();
  final AuthenticationModel _authenticationModel = locator<AuthenticationModel>();
  FetchingState _fetchingStatus = FetchingState.idle;
  bool _isSortedEsc = true;

  List<Purchase> get purchaseHistory => _isSortedEsc ? _purchaseHistory : _purchaseHistory.reversed.toList();
  List<Purchase> get smallPurchaseHistory => _purchaseHistory.take(3).toList();
  FetchingState get fetchingStatus => _fetchingStatus;
  bool get isSortedDesc => !_isSortedEsc;

  void setState(FetchingState state){
    _fetchingStatus = state;
    notifyListeners();
  }

  Future<void> getPurchaseHistory() async{
    setState(FetchingState.loading);
    await _profileService.getPurchaseHistory(_authenticationModel.user.login!, _authenticationModel.user.token!);
    _purchaseHistory = List.of( await Future.delayed(const Duration(seconds: 1), () => [
      Purchase(id: 3535, guestCount: 5, game: 'Выбор на месте', gameType: 'VR погружение', price: 1200, date: DateTime.parse('2022-10-12')),
      Purchase(id: 3535, guestCount: 9, game: 'Выбор на месте', gameType: 'VR погружение', price: 1900, date: DateTime.parse('2022-10-22')),
      Purchase(id: 3535, guestCount: 10, game: 'Выбор на месте', gameType: 'VR погружение впвпвпвпвпвпвпв', price: 2200, date: DateTime.parse('2022-10-20'))
    ]));
    _purchaseHistory.sort((prev, next) => prev.date.compareTo(next.date));
    setState(FetchingState.successful);
  }

  void setSorted(){
    _isSortedEsc = !_isSortedEsc;
    notifyListeners();
  }

}