import 'package:deepvr/ui/templates/base_profile_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BaseProfileTemplate(
        content: Center(
            child: ListView.separated(
                itemBuilder: (context, item) => Text(item.toString()),
                separatorBuilder: (context, item) => SizedBox(height: 5,),
                itemCount: 5
            )
        )
    );
  }
}
