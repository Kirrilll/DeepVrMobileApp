
import 'package:deepvr/ui/templates/booking_step_template.dart';
import 'package:deepvr/ui/widgets/players_counter.dart';
import 'package:deepvr/providers/counter_view_model.dart';
import 'package:deepvr/providers/games_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class PlayersCounterPage extends StatelessWidget {
  const PlayersCounterPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookingStepTemplate(
        content: PlayerCounter(),
        stepNumber: 3,
        stepTitle: 'Выберите количесвто игроков',
    );
  }
}
