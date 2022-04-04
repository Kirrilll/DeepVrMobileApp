import 'package:deepvr/booking_page_widgets/booking_page_maket.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/game_type_page/game_type_container.dart';
import 'package:deepvr/models/game_type_model.dart';
import 'package:deepvr/providers/game_type_view_model.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class GameTypesPage extends StatefulWidget {
  const GameTypesPage({Key? key}) : super(key: key);

  @override
  _GameTypesPageState createState() => _GameTypesPageState();
}

class _GameTypesPageState extends State<GameTypesPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final booking = Provider.of<BookingProvider>(context, listen: false);
    // booking.getTypes();
    locator<GameTypeViewModel>().getTypes();
  }

  @override
  Widget build(BuildContext context) {
    //var booking = Provider.of<BookingProvider>(context);
    return ChangeNotifierProvider.value(
      value: locator<GameTypeViewModel>(),
      child: Consumer<GameTypeViewModel>(
        builder :(context, viewModel, child)  => BookingPageMaket(
          content: viewModel.pageState == PageState.loaded
              ? GameTypeContainer(gameTypes: viewModel.gameTypes!,)
              : const Center(child: CircularProgressIndicator()),
          stepNumber: 1,
          stepTitle: 'Выберите VR комнату',
        ),
      ),
    );
  }
}
