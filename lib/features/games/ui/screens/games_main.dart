import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/games/ui/widgets/event_card.dart';
import 'package:deepvr/features/games/ui/widgets/games_container.dart';
import 'package:deepvr/features/games/data/entities/game.dart';
import 'package:deepvr/features/games/domain/view_models/games_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/usecases/helpers/bottom_sheet_helper.dart';
import '../../../../core/domain/locator.dart';
import '../widgets/games_bottom_sheet_builder.dart';

class GamesMainScreen extends StatefulWidget {
  const GamesMainScreen({Key? key}) : super(key: key);

  @override
  State<GamesMainScreen> createState() => _GamesMainScreenState();
}

class _GamesMainScreenState extends State<GamesMainScreen> {

  final _bottomSheetHelper = const BottomSheetHelper();

  void Function(Game) _showGameProfile(BuildContext context) {
    return (game) => _bottomSheetHelper.buildDefaultScrollableBottomSheet(
        context,
        (context) => GamesBottomSheetBuilder.buildBody(context, game)
    )();
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

