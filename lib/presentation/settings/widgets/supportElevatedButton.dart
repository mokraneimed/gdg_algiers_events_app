import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

class SupportElevatedButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final Color color;
  const SupportElevatedButton({
    required this.onPressed,
    required this.buttonText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .055,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: context.theme.elevatedButtonTheme.style,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: context.textTheme.titleSmall!.copyWith(
              fontSize: context.height * .015,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
