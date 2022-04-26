import 'package:deepvr/locator.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/pages/app.dart';
import 'package:deepvr/pages/booking_page.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  setup();
  runApp(const App());
}

