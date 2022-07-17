import 'dart:developer';

import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/domain/view_models/booking_games_model.dart';
import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/ui/widgets/games_container.dart';
import 'package:deepvr/data/entities/game.dart';
import 'package:deepvr/domain/view_models/games_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:deepvr/usecases/helpers/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../../domain/models/booking.dart';
import '../../providers/game_type_view_model.dart';
import '../../domain/view_models/booking_model.dart';

class GameCardPage extends StatefulWidget {
  GameCardPage({Key? key}) : super(key: key);

  @override
  State<GameCardPage> createState() => _GameCardPageState();
}

class _GameCardPageState extends State<GameCardPage> {
  void Function(Game) _selectGame(BookingGamesModel model) {
    return (game) => model.setSelectedGame(game);
  }

  @override
  Widget build(BuildContext context) {
    return BookingStepTemplate(
      stepNumber: 2,
      content: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: locator<GamesViewModel>()),
        ],
        child: Selector<BookingModel, Tuple<GameType?, Game?>>(
          selector: (_, model) => Tuple(item1: model.booking.selectedType, item2: model.booking.selectedGame),
          builder: (_, selectedTuple, __) => Consumer<GamesModel>(
            builder: (_, gamesModel, __) =>
                gamesModel.isLoaded
                    ? GamesContainer(
                          games: gamesModel.getGamesByType(selectedTuple.item1),
                          action: _selectGame(locator<BookingGamesModel>()),
                          selectedId: selectedTuple.item2?.id,
                        )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
          ),
        ),
      ),
      stepTitle: 'Выберите VR-игру',
    );
  }
}
