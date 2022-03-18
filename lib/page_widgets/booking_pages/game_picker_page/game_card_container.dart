import 'package:deepvr/page_widgets/booking_pages/game_picker_page/game_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCardContainer extends StatefulWidget {
  const GameCardContainer({Key? key}) : super(key: key);

  @override
  _GameCardContainerState createState() => _GameCardContainerState();
}

class _GameCardContainerState extends State<GameCardContainer> {

  int? activeId;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        GameCard(
            path: 'https://srt.vrbook.creatrix-digital.ru/storage/games/July2021/BxOzdFRw0XC39UKaohoH.png',
            title: 'Название',
            id: 0,
            isActive: false,
            setIsActive: (){
              setState(() {
                activeId = 0;
              });
            }
        )
      ],
    );
  }
}
