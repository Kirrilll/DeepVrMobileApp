import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({
    Key? key,
    required this.children
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          16, 5, 16, 16 + MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: Color(0xFF050411)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF444656)),
                ),
              ],
            ),
            ...children
          ],
        ),
      ),
    );
  }
}
