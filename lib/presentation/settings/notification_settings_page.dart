import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';
import '../../constants/Theme.dart';
import "widgets/Sound.dart";
import "widgets/push_notifications.dart";
import "widgets/time_notifications.dart";

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);
  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kWhite,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 38.0,
          color: AppColors.kPrimaryColor,
        ),
      ),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notifications",
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pushNotifications(),
                  const SizedBox(height: 15),
                  timeNotification(),
                  const SizedBox(height: 15),
                  Sound(),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
