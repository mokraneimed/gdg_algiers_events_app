import 'package:flutter/material.dart';
import "package:gdg_algiers_events_app/constants/Theme.dart";
import "package:gdg_algiers_events_app/constants/colors.dart";

class Sound extends StatefulWidget {
  const Sound();

  @override
  State<Sound> createState() => _SoundState();
}

class _SoundState extends State<Sound> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.boxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            const Icon(Icons.headphones),
            const SizedBox(width: 10),
            const Text("Sound"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Select"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.kPrimaryColor,
                  elevation: 5,
                  fixedSize: Size(100, 30)),
            )
          ],
        ),
      ),
    );
  }
}
