import 'package:flutter/material.dart';

abstract class IBookingModel with ChangeNotifier {
  String getUpdatingKey();
  bool isFinished();
  void onNext();
  Future<void> onNextAsync();
}