import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.kWhite,
      mini: true,
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}