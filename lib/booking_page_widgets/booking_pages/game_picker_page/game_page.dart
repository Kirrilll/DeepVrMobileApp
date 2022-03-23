import 'dart:developer';

import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_card_container.dart';
import 'package:deepvr/models/game_model/game_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCardPage extends StatefulWidget {
  const GameCardPage({
    Key? key,
    required this.gameTypeId,
    required this.setGame,
  }) : super(key: key);

  final void Function(int id) setGame; //Сверху приходит изменение стэйта
  final int gameTypeId; //Получается запрос на сервак сверху

  @override
  _GameCardPageState createState() => _GameCardPageState();
}

class _GameCardPageState extends State<GameCardPage> {
  var isLoaded = false;
  late List<GameModel> _games;

  @override
  void initState() {
    super.initState();

    RemoteService.getInstance().getGames().then((value) {
      _games = value!
          .where((game) => game.gameType.id == widget.gameTypeId)
          .toList();
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BookingPageMaket(
      stepNumber: 2,
      content: isLoaded
          ? GameCardContainer(
              games: _games,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      stepTitle: 'Выберите VR-игру',
    );
  }
}
