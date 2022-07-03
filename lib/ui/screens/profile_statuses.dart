import 'package:deepvr/ui/templates/base_profile_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileStatuses extends StatelessWidget {
  const ProfileStatuses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseProfileTemplate(
        content: Center(child: Text('Статусы'))
    );
  }
}
