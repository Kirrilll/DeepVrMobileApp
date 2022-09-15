import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/booking/ui/templates/booking_step_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/domain/locator.dart';
import '../../domain/view_models/game_type_model.dart';
import '../widgets/game_type_card.dart';

//viewModel контролирует когда она завершена, но не хранит в себе данных о  своем завершении,
//isFinished обращается в booking

class GameTypesPage extends StatelessWidget {
  const GameTypesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider.value(
      value: locator<GameTypeModel>(),
      child: Consumer<GameTypeModel>(
          builder: (_, model, __) => BookingStepTemplate(
            content: model.fetchingStatus == FetchingState.successful
              ? Align(
              alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: model.gameTypes.map((gameType) => Selector<GameTypeModel, int?>(
                            selector: (_, model) => model.selectedType?.id,
                            builder: (_, selectedId, __) => SizedBox(
                              width: 346,
                              height: 166,
                              child: GameTypeCard(
                                gameType: gameType,
                                selectedId: selectedId,
                                select: () => model.setGameType(gameType),
                              ),
                            ),
                          )
                  ).toList(),
            ),
                ),
              )
                : const Center(child: CircularProgressIndicator()),
            stepNumber: 1,
            stepTitle: 'Выберите VR комнату',
          ),
        ),
    );
  }
}
