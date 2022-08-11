import 'package:flutter/material.dart';

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
      height: 72,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tabBarItems,
      ),
    );
  }
}
