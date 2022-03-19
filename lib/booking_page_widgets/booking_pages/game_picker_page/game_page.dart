import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_card_container.dart';
import 'package:deepvr/models/game_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCardPage extends StatefulWidget {
  GameCardPage({
    Key? key,
    required this.gameTypeId,
    required this.setGame,
    required this.pageController
  }) : super(key: key);

  final void Function(int id) setGame; //Сверху приходит изменение стэйта
  final int gameTypeId; //Получается запрос на сервак сверху
  final PageController pageController;
  late  List<GameModel> games; //Получаем через get запрос

  @override
  _GameCardPageState createState() => _GameCardPageState();
}

class _GameCardPageState extends State<GameCardPage> {

  @override
  void initState() {
    // TODO: implement initState
    //Происходит fetch данных,по id типа
    widget.games = [

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BookingPageMaket(
        stepNumber: 2,
        content: const GameCardContainer(),
        stepTitle: 'Выберите VR-игру',
        pageController: widget.pageController
    );
  }
}
