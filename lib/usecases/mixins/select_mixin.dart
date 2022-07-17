import 'package:flutter/cupertino.dart';

mixin SelectMixin<T> on ChangeNotifier{
  T? _item;

  T? get item => _item;

  void setItem(T? newItem){
    _item = newItem;
    notifyListeners();
  }
}