import 'package:deepvr/features/booking/ui/templates/booking_step_template.dart';
import 'package:deepvr/features/booking/ui/widgets/players_counter.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/di/locator.dart';

class PlayersCounterPage extends StatelessWidget {
  const PlayersCounterPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookingStepTemplate(
        content: PlayerCounter(),
        stepNumber: 3,
        stepTitle: 'Выберите количество игроков',
    );
  }
}
