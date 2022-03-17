import 'package:deepvr/models/game_type.dart';
import 'package:deepvr/page_widgets/booking_pages/game_type_page/game_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameTypeContainer extends StatelessWidget {
  GameTypeContainer({Key? key}) : super(key: key);

  //В теории если ничто не выбрано, кнопка далее должна быть заблочена.
  //Значит card принимает еще isActive, при isActive, передаем id выбранной вверх, и кнопку делаем доступной
  final List<GameType> list = [
    GameType('VR Классика', 60, 1, 10),
    GameType('Полное погружение', 40, 2, 4),
    GameType('VR Арена', 40, 2, 10)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) => GameTypeCard(gameType: list![index]),
        separatorBuilder: (_, index) => const SizedBox(height: 30),
    );
  }
}
