import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Theme.dart';

class SupportTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final int maxLength;
  final Function onSubmitted;
  const SupportTextField(
      {required this.hint,
      required this.maxLines,
      required this.maxLength,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        onChanged: (value) => onSubmitted(value),
        maxLength: maxLength == 1 ? null : maxLength,
        validator: (value) =>
            hint == "Please describe the issue you encountered..."
                ? null
                : value == ''
                    ? "Your $hint please !"
                    : null,
        cursorColor: AppColors.kPrimaryColor,
        maxLines: maxLines,
        style: TextStyle(fontSize: context.height * 0.02),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: context.height * 0.02,
              vertical: context.height * 0.013),
          fillColor: AppColors.kGrey.withOpacity(0.06),
          filled: true,
          hintText: hint,
          hintStyle: context.textTheme.bodyLarge!.copyWith(
            fontSize: context.height * 0.02,
            color: AppColors.kPrimaryColor.withOpacity(0.75),
          ),
          focusedBorder: AppTheme.primaryColorInputBorder,
          errorBorder: AppTheme.redInputBorder,
          enabledBorder: AppTheme.whiteInputBorder,
          focusedErrorBorder: AppTheme.redInputBorder,
        ),
      ),
    );
  }
}
