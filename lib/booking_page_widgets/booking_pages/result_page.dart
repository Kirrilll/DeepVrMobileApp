import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../booking_page_switch_btn.dart';

class BookingResultPage extends StatelessWidget {
  const BookingResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<BookingResultsViewModel>(),
      child:  SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
          child: Consumer<BookingResultsViewModel>(
            builder: (context, viewModel, _) => viewModel.isAvailable()
                ? Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFF36C0E7), Color(0xFF4B51EA)]),
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondaryContainer
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Бронирование'),
                          Spacer(),
                          Text(viewModel.type),
                          Text(viewModel.game),
                          Text('Игроков: ${viewModel.guestCount}'),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 10),
                              Text(viewModel.date)
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(Icons.access_time),
                              SizedBox(width: 10),
                              Text(viewModel.time)
                            ],
                          ),
                          Spacer(),
                          Text('Итого: ${viewModel.price}'),
                          Spacer(),
                          BookPageSwitchingBtn(action: () => viewModel.order(),
                              text: 'Забронировать')
                        ])
                ),
              ),
            )
            : Center(child: CircularProgressIndicator()),
          ),
        )
    );
  }
}
