import 'package:flutter/material.dart';
import "package:gdg_algiers_events_app/constants/colors.dart";
import "package:gdg_algiers_events_app/constants/routes.dart";
import "package:gdg_algiers_events_app/constants/Theme.dart";

class Support extends StatefulWidget {
  const Support();

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.kSupport);
      },
      icon: const Icon(Icons.question_mark_rounded),
      label: Text("Support", style: AppTheme.textTheme.titleSmall),
      style: AppTheme.elevatedButton,
    );
  }
}
