import 'package:flutter/material.dart';

class ScaleUtil {

  Size _deviceSize = Size(referenceWidth.toDouble(), referenceHeight.toDouble());

  void init(Size deviceSize){
    _deviceSize = deviceSize;
  }

  double get deviceHeight => _deviceSize.height;
  double get deviceWidth => _deviceSize.width;

  static const referenceHeight = 812;
  static const referenceWidth = 375;

  static const referenceBottomNavBarHeight = 72;

  static const gameTypeSpacingMobile = 20.0;

  double getTextScaleFactor() {
    return  _deviceSize.width /  referenceWidth;
  }

}

