import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameTypesPage extends StatefulWidget {
  const GameTypesPage({
    Key? key,
    required this.setGameType
  }) : super(key: key);

  final void Function(int) setGameType;

  @override
  _GameTypesPageState createState() => _GameTypesPageState();
}

class _GameTypesPageState extends State<GameTypesPage> {
  @override
  Widget build(BuildContext context) {
    return const BookingPageMaket(
        content:  GameTypeContainer(),
        stepNumber: 1,
        stepTitle:'Выберите VR комнату',
    );
  }
}
