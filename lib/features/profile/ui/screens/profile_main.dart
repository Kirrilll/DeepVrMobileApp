import 'package:auto_route/auto_route.dart';
import 'package:deepvr/domain/models/purchase.dart';
import 'package:deepvr/features/authentication/domain/services/authentication_service.dart';
import 'package:deepvr/features/profile/domain/view_models/profile_model.dart';
import 'package:deepvr/features/profile/domain/view_models/purchase_history_model.dart';
import 'package:deepvr/features/profile/domain/view_models/statuses_model.dart';
import 'package:deepvr/core/ui/shared/bottom_modal.dart';
import 'package:deepvr/features/profile/ui/templates/profile_template.dart';
import 'package:deepvr/features/profile/ui/widgets/bonuses_card.dart';
import 'package:deepvr/features/profile/ui/widgets/purchase_card.dart';
import 'package:deepvr/features/profile/ui/widgets/profile_status_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../../core/usecases/special_types/fetching_state.dart';
import '../../../../core/domain/locator.dart';
import '../../../../core/ui/shared/default_button.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  late final TextEditingController _promoCodeController;

  @override
  void initState() {
    locator<ProfileModel>().getBonuses();
    locator<PurchaseHistoryModel>().getPurchaseHistory();

    //Должно сработать 1 раз
    final profileStatusesModel = locator<ProfileStatusesModel>();
    if (profileStatusesModel.fetchingStatus == FetchingState.idle) {
      profileStatusesModel.getStatuses();
    }
    _promoCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
  }
  void navToHistory(BuildContext context) => context.router.pushNamed('history');

  Color _buildBorderColor(FetchingState status) {
    switch (status) {
      case FetchingState.error:
        return const Color(0xFFEE6E7E);
      case FetchingState.successful:
        return const Color(0xFF30A5D1);
      default:
        return const Color(0xFF1F2032);
    }
  }

  Widget _buildBottomSheet(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<ProfileModel>(),
      child: Consumer<ProfileModel>(
        builder: (_, model, __) => BottomModal(
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: InkResponse(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.clear,
                  size: 30,
                  color: Color(0xFF444656),
                ),
              ),
            ),
            const SizedBox(height: 42),
            Text(
              'Введите промокод',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Focus(
                    child: Builder(builder: (context) {
                      FocusNode node = Focus.of(context);
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                                color: _buildBorderColor(
                                    model.promoCodeActivationStatus))),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: _promoCodeController,
                          style: TextStyle(
                              fontSize: 16,
                              color: node.hasFocus
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFFABAFE5)),
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.all(16),
                            fillColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none),
                            suffix: model.promoCodeActivationStatus ==
                                    FetchingState.loading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator())
                                : const SizedBox(),
                          ),
                          onSubmitted: (text) => model.activatePromoCode(
                              _promoCodeController.value.text),
                        ),
                      );
                    }),
                  ),
                  model.promoCodeActivationStatus == FetchingState.error
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            model.errorMessage!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color(0xFFEE6E7E), fontSize: 14),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Много информации',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 11),
            ),
            const SizedBox(height: 63),
            SizedBox(
                height: 64,
                child: DefaultButton(
                    actTitle: 'Применить',
                    actionCallback: () {
                      model.activatePromoCode(_promoCodeController.value.text);
                      Focus.of(context).unfocus();
                    }))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileTemplate(
      content: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: locator<ProfileModel>()),
          ChangeNotifierProvider.value(value: locator<PurchaseHistoryModel>()),
        ],
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Consumer<ProfileModel>(
                builder: (_, model, __) =>
                    model.bonusesFetchingStatus != FetchingState.successful
                        ? const CircularProgressIndicator()
                        : ProfileStatusCard.short(
                            title: model.profileStatus.title,
                            imagePath: model.profileStatus.imgPath),
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
                                    type: model.bonuses[index].title,
                                    expiredDate: model.bonuses[index].expiredDateStr,
                                  ),
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
            InkResponse(
              onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => _buildBottomSheet(_)),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Color(0xFF444656)))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Промокод или сертификат',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF444656),
                      )
                    ],
                  ),
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
                                  ..onTap = () => navToHistory(context),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF1F2032),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkResponse(
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
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
                              Row(
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
                            ]),
                      )),
                  Container(height: 1, color: const Color(0xFF444656)),
                  InkResponse(
                    onTap: () => locator<AuthenticationService>().signOut(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Выйти из аккаунта',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.41),
                          ),
                          Icon(
                            Icons.logout,
                            color: Color(0xFFABAFE5),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16)
          ],
        ))
      ),
    );
  }
}
