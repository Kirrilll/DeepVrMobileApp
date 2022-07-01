import 'package:deepvr/data/entities/bonuses.dart';
import 'package:deepvr/data/entities/purchase.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/bonus.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel with ChangeNotifier{
  //Массив статусов,
  //Массив заказов
  //Массив городов,
  final List<Purchase> _purchaseHistory = List.empty(growable: true);
  final List<Bonus> _bonuses = List.empty(growable: true);
  FetchingState _bonusesFetchingStatus = FetchingState.idle;
  FetchingState _purchaseHistoryFetchingStatus = FetchingState.idle;

  List<Bonus> get bonuses => _bonuses;
  List<Purchase> get purchaseHistory => _purchaseHistory;
  List<Purchase> get smallPurchaseHistory => _purchaseHistory.take(3).toList();
  FetchingState get bonusesFetchingStatus => _bonusesFetchingStatus;
  FetchingState get purchaseHistoryFetchingStatus => _purchaseHistoryFetchingStatus;

  Future<void> getBonuses() async{
    _bonusesFetchingStatus = FetchingState.loading;
    final bonusInfo =  await Future.delayed(
        const Duration(seconds: 2),
            () => Bonuses(quantityAll: 4, quantityExpired: 2, quantityReal: 2, nextExpiredDate: '23232323')
    );
    _bonuses.add(Bonus(title: 'Активные', count: bonusInfo.quantityReal!));
    _bonuses.add(Bonus(title: 'Временные', count: bonusInfo.quantityExpired!));
    _bonuses.add(Bonus(title: 'Все', count: bonusInfo.quantityAll!));
    _bonusesFetchingStatus = FetchingState.successful;
    notifyListeners();
  }

  Future<void> getPurchaseHistory() async{
    _purchaseHistoryFetchingStatus = FetchingState.loading;
     _purchaseHistory.addAll( await Future.delayed(const Duration(seconds: 1), () => [
       Purchase(id: 3535, guestCount: 5, game: 'Выбор на месте', gameType: 'VR погружение', price: 1200, date: DateTime.parse('2022-10-12')),
       Purchase(id: 3535, guestCount: 9, game: 'Выбор на месте', gameType: 'VR погружение', price: 1900, date: DateTime.parse('2022-10-22')),
       Purchase(id: 3535, guestCount: 10, game: 'Выбор на месте', gameType: 'VR погружение', price: 2200, date: DateTime.parse('2022-10-20'))
     ]));
     _purchaseHistoryFetchingStatus = FetchingState.successful;
     notifyListeners();
  }






}