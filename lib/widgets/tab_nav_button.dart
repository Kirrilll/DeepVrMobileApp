import 'package:deepvr/enums/routes.dart';
import 'package:flutter/material.dart';

class TabNavButton extends StatelessWidget {
  const TabNavButton({
    Key? key,
    required this.navToNamed,
    required this.iconPath,
    required this.label,
    required this.isActive
  }) : super(key: key);

  final void Function() navToNamed;
  final String iconPath;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [

        IconButton(
          iconSize: 22,
          padding: const EdgeInsets.all(0),
          alignment: Alignment.bottomCenter,
          icon:  ImageIcon(
            AssetImage(iconPath),
            size: 22,
          ),
          onPressed: () => navToNamed(),
        ),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(bottom: 5),
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
        // Container(
        //   margin: const EdgeInsets.only(top: 5),
        //   height: 2,
        //   decoration: BoxDecoration(
        //     color: isActive ? const Color(0xFF30A5D1): Colors.transparent,
        //     borderRadius: BorderRadius.circular(50)
        //   ),
        // )
      ],
    );
  }
}
