import 'package:deepvr/booking_page_widgets/booking_pages/result_page/order_page.dart';
import 'package:deepvr/booking_page_widgets/booking_pages/result_page/suc%D1%81essful_page.dart';
import 'package:deepvr/providers/booking_results_view_model.dart';
import 'package:deepvr/providers/refactor/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';

class BookingResultPage extends StatefulWidget {
  const BookingResultPage({Key? key}) : super(key: key);

  @override
  State<BookingResultPage> createState() => _BookingResultPageState();
}

class _BookingResultPageState extends State<BookingResultPage> {
  @override
  void initState() {
    locator<BookingResultsViewModel>().setStatus(RequestInfo.notSend);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: locator<BookingResultsViewModel>(),
        child: Consumer2<BookingResultsViewModel, BookingModel>(
          builder: (context, resultModel, bookingModel, _) => Stack(
            children: [
              Visibility(
                  visible: resultModel.status == RequestInfo.notSend,
                  child: OrderPage(booking: bookingModel.booking)),
              Visibility(
                  visible: resultModel.status == RequestInfo.successful,
                  child: const Successful()),
              Visibility(
                  visible: resultModel.status == RequestInfo.loading,
                  child: const Center(child: CircularProgressIndicator()))
            ],
          ),
        ));
  }
}
