import 'package:flutter/cupertino.dart';

import '../../data/entities/purchase.dart';
import '../enums/fetching_state.dart';

class PurchaseHistoryModel with ChangeNotifier{
  final List<Purchase> _purchaseHistory = List.empty(growable: true);
  FetchingState _fetchingStatus = FetchingState.idle;

  List<Purchase> get purchaseHistory => _purchaseHistory;
  List<Purchase> get smallPurchaseHistory => _purchaseHistory.take(3).toList();
  FetchingState get fetchingStatus => _fetchingStatus;


  void setState(FetchingState state){
    _fetchingStatus = state;
    notifyListeners();
  }

  Future<void> getPurchaseHistory() async{
    setState(FetchingState.loading);
    _purchaseHistory.addAll( await Future.delayed(const Duration(seconds: 1), () => [
      Purchase(id: 3535, guestCount: 5, game: 'Выбор на месте', gameType: 'VR погружение', price: 1200, date: DateTime.parse('2022-10-12')),
      Purchase(id: 3535, guestCount: 9, game: 'Выбор на месте', gameType: 'VR погружение', price: 1900, date: DateTime.parse('2022-10-22')),
      Purchase(id: 3535, guestCount: 10, game: 'Выбор на месте', gameType: 'VR погружение впвпвпвпвпвпвпв', price: 2200, date: DateTime.parse('2022-10-20'))
    ]));
    setState(FetchingState.successful);
  }

}