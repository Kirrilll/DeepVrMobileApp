import 'package:deepvr/data/entities/game_type.dart';
import 'package:deepvr/models/booking.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';
import '../../../ui/widgets/selectable_item.dart';

class GameTypeCard extends StatelessWidget {
  const GameTypeCard(
      {Key? key,
        required this.gameType,
      }) : super(key: key);

  final GameType gameType;

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingModel>(
      builder:(context, model, _ ) => GestureDetector(
        onTap: () {
          //Изменился тип, изменилось все, поэтому идет сброс
          model.updateBooking(Booking.copyWith(Booking.initial(), selectedType: gameType));
          },
        child: SelectableItem(
          isSelected: model.booking.selectedType != null && model.booking.selectedType!.id == gameType.id,
          item: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.secondaryContainer
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  gameType.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: -0.41,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TypeLimitation(
                      name: gameType.guestMin.toString() + '-' + gameType.guestMax.toString(),
                      iconPath: 'assets/icons/console.png'
                    ),
                    const TypeLimitation(name: '12+', iconPath: 'assets/icons/vrglasses.png'),
                    TypeLimitation(
                      name: gameType.timeDuration.toString() + ' мин.',
                      iconPath: 'assets/icons/clock.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TypeLimitation extends StatelessWidget {
  const TypeLimitation({
    Key? key,
    required this.name,
    required this.iconPath
  }) : super(key: key);

  final String name;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage(iconPath),
          size: 32,
          color: const Color(0xFF30A5D1),
        ),
        const SizedBox(width: 8),
        Text(
          name,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
              color: Colors.white
          ),
        )
      ],
    );
  }
}

