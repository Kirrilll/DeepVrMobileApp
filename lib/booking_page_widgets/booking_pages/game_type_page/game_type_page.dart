import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_container.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameTypesPage extends StatefulWidget {
  const GameTypesPage({Key? key, required this.setGameType}) : super(key: key);

  final void Function(int) setGameType;

  @override
  _GameTypesPageState createState() => _GameTypesPageState();
}

class _GameTypesPageState extends State<GameTypesPage> {
  List<GameTypeModel>? _gameTypes;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    RemoteService.getInstance().getGameTypes().then((value) {
      _gameTypes = value;
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BookingPageMaket(
      content: isLoaded
          ? GameTypeContainer(gameTypes: _gameTypes!,)
          : const Center(child: CircularProgressIndicator()),
      stepNumber: 1,
      stepTitle: 'Выберите VR комнату',
    );
  }
}
