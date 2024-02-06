import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';
import 'components/albums.dart';
import 'components/recaps.dart';
import 'components/screen_title.dart';
import 'components/search_box.dart';

class RecapsPage extends StatefulWidget {
  const RecapsPage({Key? key}) : super(key: key);

  @override
  State<RecapsPage> createState() => _RecapsPageState();
}

class _RecapsPageState extends State<RecapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const ScreenTitle(),
            SearchBox(
              press: () {},
              onChanged: (String value) {},
            ),
            const Recaps(),
            const Albums(),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
