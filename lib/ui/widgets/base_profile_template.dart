import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseProfileTemplate extends StatelessWidget {
  const BaseProfileTemplate(
      {
        required this.content,
        this.title = 'ПРОФИЛЬ',
        Key? key
      })
      : super(key: key);

  final Widget content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Navigator.canPop(context)
                  ? const Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(),
                    )
                  : const SizedBox(),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              InkResponse(
                child: const Icon(
                  Icons.info,
                  size: 19,
                ),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, 'profile/settings'),
              )
            ],
          ),
        ),
        content
      ],
    );
  }
}
