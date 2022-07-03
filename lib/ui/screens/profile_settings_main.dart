import 'package:deepvr/ui/widgets/base_profile_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({
    Key? key,
    required this.rootContext
  }) : super(key: key);

  final BuildContext rootContext;

  @override
  Widget build(BuildContext context) {
    return BaseProfileTemplate(
      navigatorContext: rootContext,
        content: Column(
          children: [
            const SizedBox(height: 42),
        Container(
          height: 206,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFF1F2032)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'profile/settings/update'),
                  child: const Text('Изменить профиль')
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'profile/settings/about'),
                  child: const Text('О приложении ')
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'profile/settings/feedback'),
                  child: const Text('Обратная связь')
              )
            ],
          )
        )
          ],
        )
    );
  }
}
