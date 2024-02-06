import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/Routes.dart';

class CommunityGuide extends StatefulWidget {
  const CommunityGuide();

  @override
  State<CommunityGuide> createState() => _CommunityGuideState();
}

class _CommunityGuideState extends State<CommunityGuide> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.kCommunityGuideLine);
      },
      icon: const Icon(Icons.auto_stories),
      label: const Text("Community Guidlines"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 5,
        alignment: Alignment.centerLeft,
        fixedSize: const Size(340, 50),
      ),
    );
  }
}
