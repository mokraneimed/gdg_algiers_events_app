import "package:flutter/material.dart";
import "package:gdg_algiers_events_app/constants/colors.dart";
import 'package:gdg_algiers_events_app/constants/routes.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService();

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.kTermsOfService);
      },
      icon: const Icon(Icons.assignment),
      label: const Text("Terms of service"),
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
