import 'package:auto_route/auto_route.dart';
import 'package:deepvr/domain/models/booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/domain/locator.dart';
import '../../../../core/routing/router/app_router.gr.dart';
import '../../../../core/ui/shared/default_button.dart';
import '../../../booking/ui/widgets/game_type_card.dart';
import '../../data/entities/game.dart';

class GamesBottomSheetBuilder {
  //Перемещаться и передавать Booking
  static void _selectGame(Game game, BuildContext context) {
    Navigator.of(context).pop();
    final appRouter = locator<AppRouter>();
    context.router.navigate(const BookingRouter())
        .then((value) => appRouter.push(BookingPageRoute(
        initialBooking: Booking(
            selectedGame: game,
            selectedType: game.gameType)
    )));
  }

  static List<Widget> _buildModalContent(
          {required BuildContext context,
          required Game game,
          Widget? player}) =>
      [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            game.title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TypeLimitation(
                name: (game.guestMin ?? game.gameType.guestMin).toString() +
                    '-' +
                    (game.guestMax ?? game.gameType.guestMax).toString(),
                iconPath: 'assets/icons/console.png'),
            TypeLimitation(
                name: game.ageLimit != null
                    ? game.ageLimit.toString() + '+'
                    : '0+',
                iconPath: 'assets/icons/vrglasses.png'),
            TypeLimitation(
              name:
                  (game.timeDuration ?? game.gameType.timeDuration).toString() +
                      ' мин.',
              iconPath: 'assets/icons/clock.png',
            ),
          ],
        ),
        const SizedBox(height: 16),
        player ?? const Text('Видео по этой игре еще невыоложенно'),
        const SizedBox(height: 12),
        const Text('Здесь картинки'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      children: [
                    const TextSpan(
                        text: 'Жанр: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFF5F5F5))),
                    TextSpan(
                        text: game.genre ?? 'Нет жанра',
                        style: const TextStyle(color: Color(0xFFABAFE5)))
                  ])),
            ),
            Expanded(
              flex: 1,
              child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      children: [
                    const TextSpan(
                        text: 'Зал: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFF5F5F5))),
                    TextSpan(
                        text: game.gameType.title,
                        style: const TextStyle(color: Color(0xFFABAFE5)))
                  ])),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          game.description ?? 'Нет описания',
          style: const TextStyle(
            color: Color(0xFFABAFE5),
            fontSize: 13,
          ),
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: DefaultButton(
              actionCallback: () {
                _selectGame(game, context);
              },
              actTitle: 'Забронировать'),
        ),
      ];

  static List<Widget> buildBody(BuildContext context, Game game) {
        if (game.video == null) {
          return  _buildModalContent(context: context, game: game);
        }
        return [
          YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(game.video!)!,
                    flags:
                        const YoutubePlayerFlags(autoPlay: false, loop: true)),
              ),
              builder: (context, player) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildModalContent(
                      context: context, game: game, player: player)))
        ];
      }
}
