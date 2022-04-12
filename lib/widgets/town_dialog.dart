import 'package:deepvr/location_config.dart';
import 'package:deepvr/models/location.dart';
import 'package:deepvr/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class TownDialog extends StatelessWidget {
  const TownDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF191A29)
        ),
        padding: const EdgeInsets.fromLTRB(30, 19, 30, 30),
        child: ListView.separated(
          itemCount: locationConfig.length,
          itemBuilder: (context, index) => TownDialogItem(
              location: locationConfig[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }
}


class TownDialogItem extends StatelessWidget {
  const TownDialogItem({
    Key? key,
    required this.location
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          locator<RemoteService>().init(location.api);
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Text(
              location.town,
              style:  TextStyle(
                letterSpacing: 0.3,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(width: 5),
            Text(
                '(${location.country})',
              style: TextStyle(
                letterSpacing: 0.3,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        )
    );
  }
}
