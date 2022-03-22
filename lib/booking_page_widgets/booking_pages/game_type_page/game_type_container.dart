import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameTypeContainer extends StatefulWidget {
  const GameTypeContainer({
    Key? key,
    required this.gameTypes
  }) : super(key: key);

  final List<GameTypeModel> gameTypes;

  @override
  State<GameTypeContainer> createState() => _GameTypeContainerState();
}

class _GameTypeContainerState extends State<GameTypeContainer> {
  //В теории если ничто не выбрано, кнопка далее должна быть заблочена

  int? activeId;

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose');
    super.dispose();
  }

  @override
  void initState() {
    print('init');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(activeId);
    return ListView.separated(
        itemCount: widget.gameTypes.length,
        itemBuilder: (context, index) {
          return GameTypeCard(
            gameType: widget.gameTypes[index],
            isActive: index == activeId,
            setIsActive: () {
              setState(() {
                activeId = index;
              });
            }
          );
        },
        separatorBuilder: (_, index) => const SizedBox(height: 30),
    );
  }
}
