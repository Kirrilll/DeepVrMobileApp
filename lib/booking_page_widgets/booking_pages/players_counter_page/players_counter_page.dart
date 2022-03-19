
import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/players_counter_page/players_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayersCounterPage extends StatelessWidget {
  const PlayersCounterPage({
    Key? key,
    required this.count,
    required this.setCount,
    required this.pageController,
    required this.maxPlayers,
    required this.minPlayers,
    required this.page,
    required this.pagesLength
  }) : super(key: key);

  final int maxPlayers;
  final int minPlayers;
  final int count;
  final void Function(int newCount) setCount;
  final int page;
  final int pagesLength;
  final PageController pageController;

  //В теории сюда поступает id игры, здесь происходит запрос и не нужно прокидывать max и min

  void _increment(){
    if(count < maxPlayers){
      setCount(count + 1);
    }
  }

  void _decrement(){
    if(count > minPlayers){
      setCount(count -1);
    }
  }

  void next(){
    pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return BookingPageMaket.first(
        key,
        PlayerCounter(
              count: count,
              decrement: _decrement,
              increment: _increment,
            ),
         page +1,
        'Выберите количесвто игроков',
        pageController
    );
  }
}
