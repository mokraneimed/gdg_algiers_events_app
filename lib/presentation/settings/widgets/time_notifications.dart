import "package:flutter/material.dart";
import "package:gdg_algiers_events_app/constants/Theme.dart";

class timeNotification extends StatefulWidget {
  const timeNotification();

  @override
  State<timeNotification> createState() => _timeNotificationState();
}

class _timeNotificationState extends State<timeNotification> {
  Future<void> _openTimePicker(BuildContext context) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.boxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            const Icon(Icons.access_time),
            const SizedBox(width: 10),
            const Text("Time notifications"),
            const Spacer(),
            IconButton(
                onPressed: () {
                  _openTimePicker(context);
                },
                icon: const Icon(Icons.access_alarm))
          ],
        ),
      ),
    );
  }
}
