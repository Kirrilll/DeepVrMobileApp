import 'package:deepvr/ui/widgets/bonuses_card.dart';
import 'package:deepvr/ui/widgets/profile_status_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                  color: Color(0xFFFFFFFF)
                ),
              ),
            ),
            InkResponse(
              child: const Icon(Icons.info),
              onTap: () => print('Настройки'),
            )
          ],
        ),
      ),
      SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
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
                    letterSpacing: -0.41
                  ),
                ),
                const SizedBox(height: 9),
                SizedBox(
                  height: 133,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const BonusCard(
                          count: 10000000000000, type: 'Активные'),
                      separatorBuilder: (context, index) => index < 4
                          ? const SizedBox(width: 16)
                          : const SizedBox(),
                      itemCount: 5),
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
              crossAxisAlignment: CrossAxisAlignment.stretch ,
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
                          letterSpacing: -0.41
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                          text: 'Все заказы',
                          recognizer: TapGestureRecognizer()..onTap =() => print('Переместиться к заказм'),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFFABAFE5),
                                decoration: TextDecoration.underline
                            )
                        )
                    )
                  ],
                ),
                
              ],
            ),
          )
        ],
      ))
    ]);
  }
}
