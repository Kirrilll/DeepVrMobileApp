import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/domain/view_models/game_types_model.dart';
import 'package:deepvr/core/usecases/utils/scale_util.dart';
import 'package:deepvr/features/booking/ui/templates/booking_step_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/domain/locator.dart';
import '../widgets/game_type_card.dart';

//viewModel контролирует когда она завершена, но не хранит в себе данных о  своем завершении,
//isFinished обращается в booking

class GameTypesPage extends StatelessWidget {
  const GameTypesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<GameTypeModel>(),
      child: Consumer<GameTypeModel>(
        builder: (_, model, __) => BookingStepTemplate(
          content: model.fetchingStatus == FetchingState.successful
              // ? GridView.builder(
              //     itemCount: model.gameTypes.length,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 1,
              //         mainAxisSpacing: ScaleUtil.gameTypeSpacingMobile,
              //         childAspectRatio: 2
              //     ),
              //     itemBuilder: (_, index) {
              //       return Selector<BookingModel, int?>(
              //         selector: (_, model) => model.selectedType?.id,
              //         builder: (_, selectedId, __) => GameTypeCard(
              //           gameType: model.gameTypes[index],
              //           selectedId: selectedId,
              //           select: () => locator<BookingModel>().selectedType = model.gameTypes[index],
              //         ),
              //       );
              //     },
              //   )
            ? Align(
            alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: model.gameTypes.map((gameType) => Selector<BookingModel, int?>(
                          selector: (_, model) => model.selectedType?.id,
                          builder: (_, selectedId, __) => SizedBox(
                            width: 346,
                            height: 166,
                            child: GameTypeCard(
                              gameType: gameType,
                              selectedId: selectedId,
                              select: () => locator<BookingModel>().selectedType = gameType,
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
