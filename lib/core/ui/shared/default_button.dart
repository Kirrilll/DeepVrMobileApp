import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.actTitle,
      required this.actionCallback,
      this.isActive = true})
      : super(key: key);

  final bool isActive;
  final String actTitle;
  final void Function()? actionCallback;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: isActive ? actionCallback: null,
      child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: isActive
                      ? [
                          const BoxShadow(
                              color: Color.fromRGBO(66, 130, 233, 0.45),
                              offset: Offset(0, 15),
                              blurRadius: 60)
                        ]
                      : [],
                  gradient:  LinearGradient(
                    colors: isActive? [
                      const Color(0xFF36C0E7),
                      const Color(0xFF4B51EA),
                    ]
                    : [
                      const Color(0xFF36C0E7).withOpacity(0.4),
                      const Color(0xFF4B51EA).withOpacity(0.4),
                    ],
                  ),
                ),
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Text(
              actTitle,
              textAlign: TextAlign.center,
              softWrap: false,
              style: TextStyle(
                fontSize: 16,
                color: isActive ? Colors.white : Colors.white.withOpacity(0.4)
              ),
          ),
        )),
    );
  }
}
