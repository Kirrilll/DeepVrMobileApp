import 'package:deepvr/domain/models/purchase.dart';
import 'package:deepvr/domain/view_models/profile_model.dart';
import 'package:deepvr/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/domain/view_models/statuses_model.dart';
import 'package:deepvr/ui/shared/bottom_modal.dart';
import 'package:deepvr/ui/templates/base_profile_template.dart';
import 'package:deepvr/ui/widgets/bonuses_card.dart';
import 'package:deepvr/ui/widgets/purchase_card.dart';
import 'package:deepvr/ui/widgets/profile_status_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../domain/enums/fetching_state.dart';
import '../../locator.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locator<ProfileModel>()),
        ChangeNotifierProvider.value(value: locator<PurchaseHistoryModel>()),
        ChangeNotifierProvider.value(value: locator<ProfileStatusesModel>())
      ],
      child: BaseProfileTemplate(
          content: Expanded(
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Consumer<ProfileStatusesModel>(
                builder: (_, model, __) =>
                    model.userStatusFetchingState != FetchingState.successful
                        ? const CircularProgressIndicator()
                        : ProfileStatusCard.short(
                            title: model.userStatus.title,
                            imagePath: model.userStatus.imgPath
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 206,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFF1F2032)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Баланс',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.41),
                  ),
                  const SizedBox(height: 9),
                  SizedBox(
                    height: 133,
                    child: Consumer<ProfileModel>(builder: (context, model, _) {
                      switch (model.bonusesFetchingStatus) {
                        case FetchingState.loading:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case FetchingState.successful:
                          return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => BonusCard(
                                  count: model.bonuses[index].count,
                                  type: model.bonuses[index].title),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 16),
                              itemCount: model.bonuses.length);
                        case FetchingState.error:
                          return const Center(
                            child: Text('Ошибка'),
                          );
                        default:
                          return const SizedBox();
                      }
                    }),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Здесь сраный инпут для промокдов'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF1F2032),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Consumer<PurchaseHistoryModel>(
                builder: (context, model, _) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Заказы',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.41),
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Смотреть все',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.pushNamed(
                                      context, 'profile/history',
                                      arguments: model.purchaseHistory),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFFABAFE5),
                                    decoration: TextDecoration.underline)))
                      ],
                    ),
                    const SizedBox(height: 16),
                    Builder(
                        builder: (context) => model.fetchingStatus ==
                                FetchingState.loading
                            ? const Center(child: CircularProgressIndicator())
                            : Column(
                                children: <Widget>[
                                  for (int i = 0;
                                      i < model.smallPurchaseHistory.length;
                                      i++) ...<Widget>[
                                    if (i == 0)
                                      Container(
                                          height: 1,
                                          color: const Color(0xFF444656)),
                                    PurchaseCard(
                                        purchase:
                                            model.smallPurchaseHistory[i]),
                                    Container(
                                        height: 1,
                                        color: const Color(0xFF444656))
                                  ]
                                ],
                              ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF1F2032),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Выбрать город',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.41),
                    ),
                    InkResponse(
                      radius: 10,
                      onTap: () => showBottomSheet(
                          context: context,
                          builder: (context) => const BottomModal(
                                  //Получать из модели
                                  children: [
                                    SizedBox(height: 30),
                                    Text(
                                      'Питер',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Питер',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Питер',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Питер',
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    )
                                  ])),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Саратов',
                            style: TextStyle(
                                color: Color(0xFFABAFE5), fontSize: 14),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 16)
          ],
        )),
      )),
    );
  }
}
