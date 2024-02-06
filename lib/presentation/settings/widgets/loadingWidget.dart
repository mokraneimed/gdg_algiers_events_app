import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/Colors.dart';
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 18,
      width: 18,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}