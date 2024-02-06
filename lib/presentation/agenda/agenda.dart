import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/agenda/widgets/calendar.dart';
import 'package:gdg_algiers_events_app/presentation/agenda/widgets/next_event_card.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                 Text(
                  'Next Event',
                  style: context.textTheme.titleLarge!.copyWith(fontSize: 30),
                ),
                NextEventCard(
                  isLiked: false,
                  location: 'ESI Algiers, BP 68M Oued Smar, 16309',
                  date: '17 May 2022',
                  name: 'HashCode 22',
                  image: 'assets/photos/hashcode22.jpg',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                const Calendar(),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
