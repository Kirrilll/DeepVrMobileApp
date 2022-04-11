import 'package:flutter/cupertino.dart';

class AppModel with ChangeNotifier{
  Pages _currPage = Pages.booking;

  Pages get currPage => _currPage;

  set currPage(Pages value) {
    _currPage = value;
    notifyListeners();
  }
}

enum Pages{
  booking,
  games
}
