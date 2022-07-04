import 'package:deepvr/data/entities/bonuses.dart';
import 'package:deepvr/data/entities/purchase.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/models/bonus.dart';
import 'package:deepvr/domain/view_models/authentication_model.dart';
import 'package:deepvr/locator.dart';
import 'package:flutter/cupertino.dart';

class ProfileModel with ChangeNotifier{
  final List<Bonus> _bonuses = List.empty(growable: true);
  FetchingState _bonusesFetchingStatus = FetchingState.idle;

  List<Bonus> get bonuses => _bonuses;
  FetchingState get bonusesFetchingStatus => _bonusesFetchingStatus;

  Future<void> getBonuses() async{
    _bonusesFetchingStatus = FetchingState.loading;
    final bonusInfo =  await Future.delayed(
        const Duration(seconds: 2),
            () => Bonuses(quantityAll: 4, quantityExpired: 2, quantityReal: 2, nextExpiredDate: '23232323')
    );

    _bonuses.add(Bonus(title: 'Все', count: bonusInfo.quantityAll!));
    _bonuses.add(Bonus(title: 'Активные', count: bonusInfo.quantityReal!));
    _bonuses.add(Bonus(title: 'Временные', count: bonusInfo.quantityExpired!));
    _bonusesFetchingStatus = FetchingState.successful;
    notifyListeners();
  }

}