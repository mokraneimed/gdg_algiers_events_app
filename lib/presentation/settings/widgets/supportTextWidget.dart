import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

class SupportText extends StatelessWidget {
  const SupportText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Text(
            "Support",
            style: context.textTheme.titleLarge!.copyWith(
              fontSize: deviceSize.height * .048,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Report an issue",
            style: context.textTheme.titleLarge!.copyWith(
              fontSize: deviceSize.height * .02,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
