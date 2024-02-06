import 'package:flutter/material.dart';
import "package:gdg_algiers_events_app/constants/colors.dart";
import "package:gdg_algiers_events_app/constants/routes.dart";

class Notifications extends StatefulWidget {
  const Notifications();

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.kNotifSettings);
      },
      icon: const Icon(Icons.notifications),
      label: const Text("Notifications"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.kPrimaryColor,
        elevation: 5,
        alignment: Alignment.centerLeft,
        fixedSize: const Size(340, 50),
      ),
    );
  }
}
