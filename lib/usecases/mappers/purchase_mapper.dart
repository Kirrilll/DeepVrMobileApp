import 'package:deepvr/data/entities/client_purchase.dart';
import 'package:deepvr/domain/models/purchase.dart';
import 'package:deepvr/domain/view_models/games_model.dart';
import 'package:deepvr/locator.dart';
import 'package:deepvr/providers/game_type_view_model.dart';

class PurchaseMapper{
  final GamesModel _gamesModel = locator<GamesModel>();
  final GameTypeViewModel _gameTypeModel = locator<GameTypeViewModel>();
  bool _isInit = false;

  bool get isInit => _isInit;

  Future<void> init() async {
    await _gamesModel.getGames();
    await _gameTypeModel.getTypes();
    _isInit = true;
  }

   Purchase toEntity(ClientPurchase purchase){
    return Purchase(
        id: purchase.id,
        guestCount: purchase.guestQuantity,
        game: _gamesModel.games!.firstWhere((game) => game.id == purchase.gameId).title,
        gameType: _gameTypeModel.gameTypes!.firstWhere((gameType) => gameType.id == purchase.roomId).title,
        price: purchase.price,
        date: DateTime.parse(purchase.bookingDate)
    );
  }
}