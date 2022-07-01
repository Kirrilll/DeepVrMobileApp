import 'package:deepvr/data/entities/purchase.dart';
import 'package:deepvr/domain/view_models/profile_model.dart';
import 'package:deepvr/ui/widgets/bonuses_card.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<ProfileModel>(),
      child: Consumer<ProfileModel>(
        builder: (context, model, _) =>
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                const Center(
                  child: Text(
                    'ПРОФИЛЬ',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
                InkResponse(
                  child: const Icon(Icons.info),
                  onTap: () => print('Настройки'),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: ProfileStatusCard.short(
                      title: 'Игроман', imagePath: 'assets/images/status.png'),
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
                        child: Builder(builder: (context) {
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
                                  separatorBuilder: (context, index) => const SizedBox(width: 16),
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
                  child: Column(
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
                                    ..onTap = () => print('Переместиться к заказм'),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xFFABAFE5),
                                      decoration: TextDecoration.underline)))
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Selector<ProfileModel, MapEntry<FetchingState, List<Purchase>>>(
                      //   selector: (context, model ) => MapEntry(model.purchaseHistoryFetchingStatus, model.smallPurchaseHistory),
                      //   builder: (context, data, _) =>data.value.map((e) => Text(e.game)),
                      // )

                    ],
                  ),
                )
              ],
            )),
          )
        ]),
      ),
    );
  }
}
