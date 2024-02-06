import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34.0, top: 60.0),
      child: Text(
        'Gallery',
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
