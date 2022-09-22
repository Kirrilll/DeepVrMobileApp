import 'package:deepvr/core/usecases/utils/scale_util.dart';
import 'package:flutter/material.dart';

import '../../di/locator.dart';

class TabNavBar extends StatelessWidget {
  const TabNavBar({
    Key? key,
    required this.tabBarItems
  }) : super(key: key);

  final List<Widget> tabBarItems;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.fromLTRB(35, 11, 35, 15),
        height: ScaleUtil.referenceBottomNavBarHeight * (locator<ScaleUtil>().deviceHeight / ScaleUtil.referenceHeight),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabBarItems,
        ),
      );
  }
}
