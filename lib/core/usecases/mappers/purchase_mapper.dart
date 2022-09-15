import 'package:deepvr/features/booking/domain/view_models/game_type_model.dart';
import 'package:deepvr/features/games/domain/services/games_service.dart';
import 'package:deepvr/features/profile/data/entities/client_purchase.dart';
import 'package:deepvr/domain/models/purchase.dart';
import 'package:deepvr/core/domain/locator.dart';

import '../../../features/games/data/entities/game.dart';

class PurchaseMapper{
  final GamesService _gamesService = locator<GamesService>();
  final GameTypeModel _gameTypeModel = locator<GameTypeModel>();
  bool _isInit = false;

  late final List<Game> games;

  bool get isInit => _isInit;

  Future<void> init() async {
    games = await _gamesService.games.single;
    await _gameTypeModel.loadTypes();
    _isInit = true;
  }

   Purchase toEntity(ClientPurchase purchase){
    return Purchase(
        id: purchase.id,
        guestCount: purchase.guestQuantity,
        game: games.firstWhere((game) => game.id == purchase.gameId).title,
        gameType: _gameTypeModel.gameTypes.firstWhere((gameType) => gameType.id == purchase.roomId).title,
        price: purchase.price,
        date: DateTime.parse(purchase.bookingDate)
    );
  }
}