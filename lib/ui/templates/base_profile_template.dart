import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseProfileTemplate extends StatelessWidget {
  const BaseProfileTemplate(
      {
        required this.content,
        this.title = 'ПРОФИЛЬ',
        this.navigatorContext,
        Key? key
      })
      : super(key: key);

  final Widget content;
  final String title;
  final BuildContext? navigatorContext;

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
              Navigator.of(navigatorContext ?? context).canPop()
                  ?  Align(
                      alignment: Alignment.centerLeft,
                      child: InkResponse(
                          onTap: () => Navigator.pop(navigatorContext ?? context),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                  Icons.arrow_back_ios_rounded,
                                size: 18,
                                color: Color(0xFFABAFE5),
                              ),
                              SizedBox(width: 8),
                              Text(
                                  'Back',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFABAFE5),
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          )
                      ),
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
                    Navigator.pushNamed(context, 'profile/settings'),
              )
            ],
          ),
        ),
        content
      ],
    );
  }
}
