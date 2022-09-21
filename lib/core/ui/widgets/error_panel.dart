import 'package:flutter/material.dart';

class ErrorPanel extends StatelessWidget {
  const ErrorPanel({
    Key? key,
    required this.message
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 18),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xFF1F2032)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkResponse(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.clear,
                  size: 30,
                  color: Color(0xFF444656),
                ),
              ),
            ),
            Image.asset('assets/images/error.png'),
            const SizedBox(height: 39),
            Text(
              message.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 46
              ),
            )
          ],
        ),
      ),
    );
  }
}
