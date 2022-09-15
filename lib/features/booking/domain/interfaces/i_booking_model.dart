import 'package:flutter/material.dart';

abstract class IBookingModel with ChangeNotifier {
  bool isFinished();
  void onNext();
  Future<void> onNextAsync();
}