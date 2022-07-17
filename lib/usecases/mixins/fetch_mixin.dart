import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:flutter/cupertino.dart';

mixin FetchMixin on ChangeNotifier {
  FetchingState _fetchingStatus = FetchingState.idle;

  FetchingState get fetchingStatus => _fetchingStatus;

  void setStatus(FetchingState status){
    _fetchingStatus = status;
    notifyListeners();
  }
}