import 'package:deepvr/ui/widgets/base_profile_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseProfileTemplate(
        content: Center(
            child: Text('История')
        )
    );
  }
}
