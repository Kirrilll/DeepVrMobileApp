import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/profile/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/features/profile/ui/templates/profile_template.dart';
import 'package:deepvr/features/profile/ui/widgets/purchase_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/locator.dart';


class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ProfileTemplate(
      content: ChangeNotifierProvider.value(
            value: locator<PurchaseHistoryModel>(),
            child: Consumer<PurchaseHistoryModel>(
              builder:(context, model, _) =>  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                            'Заказы',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.41),
                        ),
                        IconButton(
                            iconSize: 24,
                            onPressed: () => model.setSorted(),
                            icon: Icon(
                              Icons.sort,
                              color: model.isSortedDesc
                                  ? const Color(0xFFABAFE5)
                                  : const Color(0xFF444656),
                            )
                        )
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
    );
  }
}
