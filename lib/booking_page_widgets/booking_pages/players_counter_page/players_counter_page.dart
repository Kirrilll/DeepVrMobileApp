
import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/players_counter_page/players_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayersCounterPage extends StatelessWidget {
  const PlayersCounterPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookingPageMaket(
        content: PlayerCounter(),
        stepNumber: 3,
        stepTitle: 'Выберите количесвто игроков',
    );
  }
}
