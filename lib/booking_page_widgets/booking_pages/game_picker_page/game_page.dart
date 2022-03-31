import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_card_container.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/providers/booking_provider.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameCardPage extends StatelessWidget {
  const GameCardPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gamesProvider = Provider.of<GamesProvider>(context, listen: true);
    var bookingProvider = Provider.of<BookingProvider>(context, listen: true);
    return BookingPageMaket(
      stepNumber: 2,
      content: gamesProvider.isLoaded
          ? GameCardContainer(
              games: gamesProvider.games!.where((game) {
                if(bookingProvider.selectedGameType != null){
                  return game.gameType.id == bookingProvider.selectedGameType!.id;
                }
                return true;
              }).toList())
          : const Center(
              child: CircularProgressIndicator(),
            ),
      stepTitle: 'Выберите VR-игру',
    );
  }
}
