import "package:flutter/material.dart";
import "package:gdg_algiers_events_app/constants/Theme.dart";
import "package:gdg_algiers_events_app/constants/Colors.dart";

class pushNotifications extends StatefulWidget {
  const pushNotifications();

  @override
  State<pushNotifications> createState() => _pushNotificationsState();
}

class _pushNotificationsState extends State<pushNotifications> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.boxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            const Icon(Icons.vibration),
            const SizedBox(width: 10),
            const Text("Push notifications"),
            const Spacer(),
            Switch(
              value: isSwitched,
              activeColor: AppColors.kPrimaryColor,
              onChanged: (value) {
                setState(
                  () {
                    isSwitched = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
