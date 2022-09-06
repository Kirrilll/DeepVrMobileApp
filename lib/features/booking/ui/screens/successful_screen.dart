import 'package:auto_route/auto_route.dart';
import 'package:deepvr/core/ui/shared/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  VoidCallback navToProfile(BuildContext context) {
    return () => context.navigateNamedTo('account');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Image(image: AssetImage('assets/images/done.png')),
            const SizedBox(height: 39),
            const Text(
                'ВАША БРОНЬ ПРИНЯТА!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 39),
            const Text(
                'В ближайшее время с вами свяжется менеджер для подтверждения бронирования.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFABAFE5)
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: DefaultButton(
                    actTitle: 'Жду встречи!',
                    actionCallback: navToProfile(context)
                  ),
                )
              ],
            ),
            //const SizedBox(height: 35)
          ],
        ),
    );
  }
}
