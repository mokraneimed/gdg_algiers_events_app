import "package:flutter/material.dart";

import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/fonts.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/event_card.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/popular_event_slide.dart';

import '../../../models/event.dart';
import '../classes/event.dart';

class EventList extends StatefulWidget {
  const EventList();

  @override
  State<EventList> createState() => _EventListState();
}
class _EventListState extends State<EventList> {
  double width = 50;
  bool on = true;
  late int filterIndex = 0;
  List<String> eventsFilter = [
    "Last Events",
    "Soon",
    "Internal",
    "Online",
    "GDG"
  ];
  List<Event> lastEvents = [
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "HashCode 22",
        coverPhoto: "assets/photos/hashcode22.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "HashCode 22",
        coverPhoto: "assets/photos/hashcode22.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "HashCode 22",
        coverPhoto: "assets/photos/hashcode22.jpg"),
  ];
  List<Event> soonEvents = [
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "DevFest 21",
        coverPhoto: "assets/photos/devfest21.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "DevFest 21",
        coverPhoto: "assets/photos/devfest21.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "DevFest 21",
        coverPhoto: "assets/photos/devfest21.jpg"),
  ];
  List<Event> internalEvents = [
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "IWD 22",
        coverPhoto: "assets/photos/iwd22.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "IWD 22",
        coverPhoto: "assets/photos/iwd22.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "IWD 22",
        coverPhoto: "assets/photos/iwd22.jpg"),
  ];
  List<Event> onlineEvents = [
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "HashCode 22",
        coverPhoto: "assets/photos/hashcode22.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "HashCode 22",
        coverPhoto: "assets/photos/hashcode22.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "HashCode 22",
        coverPhoto: "assets/photos/hashcode22.jpg"),
  ];
  List<Event> gdgEvents = [
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "DevFest 21",
        coverPhoto: "assets/photos/devfest21.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "DevFest 21",
        coverPhoto: "assets/photos/devfest21.jpg"),
    Event(
        location: "ESi Algiers , BP 68M OUED SMAR, 16309",
        name: "DevFest 21",
        coverPhoto: "assets/photos/devfest21.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: eventsFilter.length,
              itemBuilder: (context, index) => Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.kPrimaryColor.withOpacity(0.1)),
                    ),
                    onPressed: () {
                      setState(() {
                        filterIndex = index;
                      });
                    },
                    child: Text(
                      eventsFilter[index],
                      style: TextStyle(
                        fontFamily: AppFonts.poppins,
                        color: index == filterIndex
                            ? AppColors.kPrimaryColor
                            : AppColors.kColor1,
                        fontWeight: index == filterIndex
                            ? FontWeight.w700
                            : FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  index == filterIndex
                      ? const Positioned(
                          bottom: 0,
                          child: Icon(
                            Icons.circle,
                            color: AppColors.kOrangeColor,
                            size: 15,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 20,
                maxHeight: 200,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: filterIndex == 0
                    ? lastEvents
                        .map((e) => EventCard.fromEvent(e, () {}))
                        .toList()
                    : filterIndex == 1
                        ? soonEvents
                            .map((e) => EventCard.fromEvent(e, () {}))
                            .toList()
                        : filterIndex == 2
                            ? internalEvents
                                .map((e) => EventCard.fromEvent(e, () {}))
                                .toList()
                            : filterIndex == 3
                                ? onlineEvents
                                    .map((e) => EventCard.fromEvent(e, () {}))
                                    .toList()
                                : gdgEvents
                                    .map((e) => EventCard.fromEvent(e, () {}))
                                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
