import 'dart:developer';

import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/games_container.dart';
import 'package:deepvr/data/entities/game.dart';
import 'package:deepvr/domain/view_models/games_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';
import '../../../models/refactor/booking.dart';
import '../../../providers/game_type_view_model.dart';
import '../../../providers/refactor/booking_model.dart';

class GameCardPage extends StatefulWidget {
  GameCardPage({Key? key}) : super(key: key);

  @override
  State<GameCardPage> createState() => _GameCardPageState();
}

class _GameCardPageState extends State<GameCardPage> {
  final gamesProvider = locator<GamesModel>();

  @override
  void initState() {
    super.initState();
  }

  void Function(Game) _selectGame(BookingModel bookingViewModel){
    return (game) => bookingViewModel.updateBooking(Booking.copyWith(bookingViewModel.booking,
        selectedGame: game,
        selectedType: game.gameType,
        guestCount: game.guestMin ?? game.gameType.guestMin)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BookingStepTemplate(
      stepNumber: 2,
      content: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: locator<GamesViewModel>()),
          ChangeNotifierProvider.value(value: locator<BookingModel>())
        ],
        child: Consumer2<BookingModel, GamesModel>(
          builder: (context, bookingModel, gamesModel, child) =>
              gamesModel.isLoaded
                  ? GamesContainer(
                      games: gamesProvider.games!.where((game) {
                      if (bookingModel.booking.selectedType != null) {
                        return game.gameType.id == bookingModel.booking.selectedType!.id;
                      }
                      return true;
                    }).toList(),
                action: _selectGame(bookingModel),
                selectedId: bookingModel.booking.selectedGame?.id,
              )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
      stepTitle: 'Выберите VR-игру',
    );
  }
}
