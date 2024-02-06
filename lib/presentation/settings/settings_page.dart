import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';
import '../../constants/Theme.dart';
import '../../constants/routes.dart';
import "widgets/navigation_buttons/Notifications.dart";
import "widgets/navigation_buttons/TermsOfService.dart";
import "widgets/navigation_buttons/CommunityGuide.dart";
import "widgets/navigation_buttons/Support.dart";
import "widgets/social_media_widget.dart";
import '../../constants/social_media_links.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Notifications(),
                        const SizedBox(height: 15),
                        TermsOfService(),
                        const SizedBox(height: 15),
                        CommunityGuide(),
                        const SizedBox(height: 15),
                        Support(),
                      ],
                    ),
                  ),
                  const SocialMedia(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
