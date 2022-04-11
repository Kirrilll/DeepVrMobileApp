import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_card_container.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';
import '../../../providers/game_type_view_model.dart';
import '../../../providers/refactor/booking_model.dart';

class GameCardPage extends StatefulWidget {
  GameCardPage({Key? key}) : super(key: key);

  @override
  State<GameCardPage> createState() => _GameCardPageState();
}

class _GameCardPageState extends State<GameCardPage> {
  final gamesProvider = locator<GamesProvider>();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BookingPageMaket(
      stepNumber: 2,
      content: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: locator<GamesViewModel>()),
          ChangeNotifierProvider.value(value: locator<BookingModel>())
        ],
        child: Consumer2<BookingModel, GamesProvider>(
          builder: (context, bookingModel, gamesModel, child) =>
              gamesModel.isLoaded
                  ? GameCardContainer(
                      games: gamesProvider.games!.where((game) {
                      if (bookingModel.booking.selectedType != null) {
                        return game.gameType.id == bookingModel.booking.selectedType!.id;
                      }
                      return true;
                    }).toList())
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
      stepTitle: 'Выберите VR-игру',
    );
  }
}
