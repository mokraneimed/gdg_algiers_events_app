import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Theme.dart';
import '../support_page.dart';

class IssueTile extends StatelessWidget {
  final String issueTitle;
  final Errors? groupValue;
  final Function onChanged;
  final Errors value;
  const IssueTile(
      {required this.issueTitle,
      required this.groupValue,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .08,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.boxDecoration,
      child: Center(
        child: ListTile(
          title: Text(
            issueTitle,
            style: context.textTheme.titleMedium!.copyWith(
              fontSize: context.height * .025,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Radio<Errors>(
            activeColor: AppColors.kPrimaryColor,
            value: value,
            groupValue: groupValue,
            onChanged: (Errors? value) => onChanged(value),
          ),
        ),
      ),
    );
  }
}
