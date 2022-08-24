import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/games/ui/widgets/event_card.dart';
import 'package:deepvr/features/games/ui/widgets/games_container.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/view_models/games_model.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:deepvr/core/ui/shared/bottom_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../booking/ui/widgets/game_type_card.dart';
import '../../../../core/domain/locator.dart';
import '../../../../core/ui/shared/default_button.dart';

class GamesMainScreen extends StatefulWidget {
  const GamesMainScreen({Key? key}) : super(key: key);

  @override
  State<GamesMainScreen> createState() => _GamesMainScreenState();
}

class _GamesMainScreenState extends State<GamesMainScreen> {
  void Function(Game) _showGameProfile(BuildContext context) {
    return (game) => showBottomSheet(
        // isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => game.video == null
            ? GameBottomModalSheet(game: game)
            : YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(game.video!)!,
                      flags: const YoutubePlayerFlags(autoPlay: false, loop: true)),
                ),
                builder: (context, player) => GameBottomModalSheet(game: game, player: player)));
  }

  final TextStyle _headerStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
      fontFamily: 'Bebas');

  @override
  void initState() {
    locator<GamesModel>().getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: locator<GamesModel>()),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('НОВОСТИ', style: _headerStyle, textAlign: TextAlign.left),
              const SizedBox(height: 16),
              SizedBox(
                height: 104,
                child: Consumer<GamesModel>(
                    builder: (_, model, __) => model.eventsFetchingStatus == FetchingState.successful
                            ? ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: model.events!.length,
                                itemBuilder: (context, index) => EventCard.fromModel(model.events![index]),
                                separatorBuilder: (context, index) => index != 3
                                    ? const SizedBox(width: 16)
                                    : const SizedBox(),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              )
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'ИГРЫ',
                style: _headerStyle,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              Expanded(
              //     child: Consumer<GamesModel>(
              //   builder: (_, model, __) =>
              //       model.gamesFetchingStatus == FetchingState.successful
              //           ? GamesContainer(
              //               games: model.games!,
              //               action: _showGameProfile(context)
              //       )
              //           : const Center(child: CircularProgressIndicator()),
              // )
                child: StreamBuilder<List<Game>>(
                  stream: locator<GamesModel>().gamesStream,
                  builder: (_, snapshot) {
                    if(snapshot.hasData){
                      return GamesContainer(
                          games: snapshot.requireData,
                          action: _showGameProfile(context)
                      );
                    }
                    else if(snapshot.hasError){
                      return const Center(child: Text('Ошибка'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          )),
    );
  }
}

class GameBottomModalSheet extends StatelessWidget {
  const GameBottomModalSheet({Key? key, required this.game, this.player})
      : super(key: key);

  final Game game;
  final Widget? player;

  void _selectGame(Game game) {
    var bookingModel = locator<BookingModel>();
    bookingModel.selectedType = game.gameType;
    bookingModel.selectedGame = game;
  }

  @override
  Widget build(BuildContext context) {
    return BottomModal(children: [
      SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 28),
              Text(game.title),
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
                          : 'Без ограничения',
                      iconPath: 'assets/icons/vrglasses.png'),
                  TypeLimitation(
                    name: (game.timeDuration ?? game.gameType.timeDuration)
                            .toString() +
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: DefaultButton(
                    actionCallback: () {
                      _selectGame(game);
                      context.navigateNamedTo('booking');
                      // Navigator.of(context).pop();
                      // locator<RoutesModel>().navigateToNamed(RoutesModel.booking);
                    },
                    actTitle: 'Забронировать'),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
