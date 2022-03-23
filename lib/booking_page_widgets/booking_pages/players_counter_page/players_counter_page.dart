
import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/players_counter_page/players_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayersCounterPage extends StatefulWidget {
  const PlayersCounterPage({
    Key? key,
    required this.count,
    required this.setCount,
    required this.maxPlayers,
    required this.minPlayers,
  }) : super(key: key);

  final int maxPlayers;
  final int minPlayers;
  final int count;
  final void Function(int newCount) setCount;

  @override
  State<PlayersCounterPage> createState() => _PlayersCounterPageState();
}

class _PlayersCounterPageState extends State<PlayersCounterPage> {
  //В теории сюда поступает id игры, здесь происходит запрос и не нужно прокидывать max и min

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void _increment(){
    if(widget.count < widget.maxPlayers){
      widget.setCount(widget.count + 1);
    }
  }

  void _decrement(){
    if(widget.count > widget.minPlayers){
      widget.setCount(widget.count -1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BookingPageMaket(
        content: PlayerCounter(
              count: widget.count,
              decrement: _decrement,
              increment: _increment,
            ),
        stepNumber: 2,
        stepTitle: 'Выберите количесвто игроков',
    );
  }
}
