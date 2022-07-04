import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/ui/templates/base_profile_template.dart';
import 'package:deepvr/ui/widgets/purchase_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/entities/purchase.dart';
import '../../locator.dart';


class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BaseProfileTemplate(
        content: ChangeNotifierProvider.value(
          value: locator<PurchaseHistoryModel>(),
          child: Consumer<PurchaseHistoryModel>(
            builder:(context, model, _) =>  Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Заказы'),
                        Text('Сортировка')
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Builder(
                        builder: (context) => model.fetchingStatus == FetchingState.loading
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemBuilder: (context, index) => Column(
                                children: [
                                  if(index == 0) Container(height: 1, color: const Color(0xFF444656)),
                                  PurchaseCard(purchase: model.purchaseHistory[index]),
                                  Container(height: 1, color: const Color(0xFF444656))
                                ],
                              ),
                              itemCount: model.purchaseHistory.length
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
