
import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/features/games/ui/widgets/games_container.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/view_models/games_model.dart';
import 'package:deepvr/usecases/helpers/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../locator.dart';
import '../../../../domain/view_models/booking_model.dart';

class GameCardPage extends StatelessWidget {
  const GameCardPage({Key? key}) : super(key: key);

  void Function(Game) _selectGame(BookingModel model) {
    return (game) => model.selectedGame = game;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingGamesModel>(),
      child: BookingStepTemplate(
        stepNumber: 2,
        content: Selector<BookingModel, Tuple<GameType?, Game?>>(
            selector: (_, model) => Tuple(item1: model.selectedType, item2: model.selectedGame),
            builder: (_, selectedTuple, __) => Consumer<BookingGamesModel>(
              builder: (_, gamesModel, __) =>
                  gamesModel.fetchingStatus == FetchingState.successful
                      ? GamesContainer(
                            games: gamesModel.getGamesByType(selectedTuple.item1?.id),
                            action: _selectGame(locator<BookingModel>()),
                            selectedId: selectedTuple.item2?.id,
                          )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            ),
          ),
        stepTitle: 'Выберите VR-игру',
      ),
    );
  }
}
