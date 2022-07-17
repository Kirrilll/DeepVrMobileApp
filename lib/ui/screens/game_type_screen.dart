import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/domain/view_models/game_types_model.dart';
import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/data/services/booking_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../widgets/game_type_card.dart';

//viewModel контролирует когда она завершена, но не хранит в себе данных о  своем завершении,
//isFinished обращается в booking

class GameTypesPage extends StatefulWidget {
  const GameTypesPage({Key? key}) : super(key: key);

  @override
  _GameTypesPageState createState() => _GameTypesPageState();
}

class _GameTypesPageState extends State<GameTypesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<GameTypeModel>(),
      child: Consumer<GameTypeModel>(
        builder: (_, model, __) => BookingStepTemplate(
          content: model.fetchingStatus == FetchingState.successful
              ? ListView.separated(
                  itemCount: model.gameTypes.length,
                  itemBuilder: (context, index) {
                    return GameTypeCard(
                      gameType: model.gameTypes[index],
                      selectedId: model.selectedType?.id,
                      select: () => model.setSelectedType(model.gameTypes[index]),
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(height: 30),
                )
              : const Center(child: CircularProgressIndicator()),
          stepNumber: 1,
          stepTitle: 'Выберите VR комнату',
        ),
      ),
    );
  }
}
