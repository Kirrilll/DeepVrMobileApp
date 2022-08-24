
import 'package:deepvr/features/booking/data/entities/game_type.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/booking/domain/view_models/booking_games_model.dart';
import 'package:deepvr/features/booking/ui/templates/booking_step_template.dart';
import 'package:deepvr/features/games/ui/widgets/games_container.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/view_models/games_model.dart';
import 'package:deepvr/core/usecases/special_types/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/domain/locator.dart';
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
            builder: (_, selectedTuple, __) => StreamBuilder<List<Game>>(
                stream: locator<BookingGamesModel>().gamesStreamByTypeId(selectedTuple.item1?.id ?? 0),
                builder: (_, snapshot) {
                  if(snapshot.hasData){
                    return GamesContainer(
                      games: snapshot.requireData,
                      action: _selectGame(locator<BookingModel>()),
                      selectedId: selectedTuple.item2?.id,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }
            )
          ),
        stepTitle: 'Выберите VR-игру',
      ),
    );
  }
}
