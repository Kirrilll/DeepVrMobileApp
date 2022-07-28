import 'package:deepvr/domain/enums/routes.dart';
import 'package:flutter/material.dart';

class TabNavButton extends StatelessWidget {
  const TabNavButton(
      {Key? key,
      required this.navToNamed,
      required this.iconPath,
      required this.label,
      required this.isActive})
      : super(key: key);

  final void Function() navToNamed;
  final String iconPath;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => navToNamed(),
      child: Column(
        children: [
          Image.asset(
                iconPath,
              width: 22,
              height: 22,
            ),

          Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: isActive ? const Color(0xFF30A5D1): Colors.transparent,
                        width: 2,
                        style: BorderStyle.solid
                    )
                )
              ),
              child: Text(
                  label,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: -0.41,
                    //fontFamily: 'Gilroy'
                ),
              )
          ),
        ],
      ),
    );
  }
}
