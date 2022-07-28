import 'package:deepvr/domain/enums/routes.dart';
import 'package:deepvr/domain/view_models/routes_model.dart';
import 'package:deepvr/ui/shared/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

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
                    actionCallback: () => locator<RoutesModel>().navigateToNamed(Routes.identification)
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
