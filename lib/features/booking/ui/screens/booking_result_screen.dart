import 'package:deepvr/core/domain/locator.dart';
import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/booking/domain/view_models/results_model.dart';
import 'package:deepvr/features/booking/ui/screens/booking_information_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/view_models/result_state.dart';

//TODO нормально хэндлить ошибку
//TODO вызывать метод getBooking
class BookingResultScreen extends StatelessWidget {
  const BookingResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<ResultsModel>(),
      child: Selector<ResultsModel, ResultState>(
        selector: (_, model) => model.state,
        builder: (_, state, __)  {
                switch(state.fetchingStatus){
                  case FetchingState.idle:
                    return  const SizedBox();
                  case FetchingState.error:
                    return Center(child: Text(state.errorMessage ?? ''));
                  case FetchingState.loading:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    return BookingInformationScreen(bookingInformation: state.bookingInformation!);
                }
              }
            )
      );
  }
}

class ResultRow extends StatelessWidget {
  const ResultRow({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          text,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
