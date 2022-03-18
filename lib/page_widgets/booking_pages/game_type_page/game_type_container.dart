import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/page_widgets/booking_pages/game_type_page/game_type_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameTypeContainer extends StatefulWidget {
  const GameTypeContainer({Key? key}) : super(key: key);

  @override
  State<GameTypeContainer> createState() => _GameTypeContainerState();
}

class _GameTypeContainerState extends State<GameTypeContainer> {
  //В теории если ничто не выбрано, кнопка далее должна быть заблочена.
  final List<GameTypeModel> list = [
    GameTypeModel('VR Классика', 60, 1, 10),
    GameTypeModel('Полное погружение', 40, 2, 4),
    GameTypeModel('VR Арена', 40, 2, 10)
  ];

  int? activeId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GameTypeCard(
            gameType: list[index],
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
