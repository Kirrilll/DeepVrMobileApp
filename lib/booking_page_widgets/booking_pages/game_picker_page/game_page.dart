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

class GameCardPage extends StatelessWidget {
  const GameCardPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gamesProvider = Provider.of<GamesProvider>(context, listen: true);
    return BookingPageMaket(
      stepNumber: 2,
      content: gamesProvider.isLoaded
          ? MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: locator<GamesViewModel>()),
              ChangeNotifierProvider.value(value: locator<GameTypeViewModel>())
            ],
            child: Consumer<GameTypeViewModel>(
              builder: (context, gameTypeViewModel, child) => GameCardContainer(
                    games: gamesProvider.games!.where((game) {
                      if(gameTypeViewModel.selectedType != null){
                        return game.gameType.id == locator<GameTypeViewModel>().selectedType!.id;
                      }
                      return true;
                    }).toList()),
            ),
          )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      stepTitle: 'Выберите VR-игру',
    );
  }
}
