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


  Widget _buildResultPage() {
    var model = locator<BookingResultsViewModel>();
    switch (model.status) {
      case RequestInfo.notSend:
        return OrderPage(booking : locator<BookingModel>().booking );
      case RequestInfo.loading:
        return const Center(child: CircularProgressIndicator());
      case RequestInfo.successful:
        return const Successful();
      case RequestInfo.error:
        return const Text('Нет соединения');
    }
  }

  @override
  void initState() {
    locator<BookingResultsViewModel>().setStatus(RequestInfo.notSend);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: locator<BookingResultsViewModel>(),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Consumer<BookingResultsViewModel>(
              builder: (context, viewModel, _) =>  Padding(
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
                          padding: const EdgeInsets.all(15),
                          child: _buildResultPage(),
                        ),
                      )),
            )));
  }
}
