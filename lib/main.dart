import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/date_picker_page/date_picker_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/form_page/form.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_card_container.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_picker_page/game_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_container.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/players_counter_page/players_counter.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/players_counter_page/players_counter_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_container.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/time_picker_page/time_picker_page.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/pages/app.dart';
import 'package:deepvr/pages/booking_page.dart';
import 'package:deepvr/providers/games_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => GamesProvider()..getGames(),
          lazy: false,
      )
    ],
      child: MaterialApp(
          theme: ThemeData.from(
            colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: Colors.white,
                secondary: const Color(0xFFABAFE5),
                background: Colors.black,
                secondaryContainer: const Color(0xFF1F2032)
            ),
          ),
          home:  App()
      )),
    );

}

