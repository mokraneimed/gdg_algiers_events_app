import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/Theme.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/recaps/components/recaps_item.dart';

class Recaps extends StatefulWidget {
  const Recaps({Key? key}) : super(key: key);

  @override
  State<Recaps> createState() => _RecapsState();
}

class _RecapsState extends State<Recaps> {
  List items = [
    {
      "imageLink": "assets/photos/all t-2-2.jpg",
      "title": "Season Recap",
      "url": "https://www.youtube.com/watch?v=cQaU1zBDVw8",
    },
    {
      "imageLink": "assets/photos/devfest21.jpg",
      "title": "DevFest 2021",
      "url": "https://www.youtube.com/watch?v=09WHauAc4YU",
    },
    {
      "imageLink":
          "assets/photos/49053176_2283474741670938_3644168184585519104_n.jpg",
      "title": "Welcome Day ",
      "url": "https://www.youtube.com/watch?v=sGIHCnVMY0A",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSectionTitle(),
          const SizedBox(
            height: 16,
          ),
          getRecapsList(),
        ],
      ),
    );
  }

  Widget getSectionTitle() {
    return Text(
      'Recaps',
      style: context.textTheme.titleMedium,
    );
  }

  Widget getRecapsList() {
    return SizedBox(
      height: 196,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => const SizedBox(width: 24),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 196,
            width: 306,
            child: RecapsItem(
              imageLink: items[index]["imageLink"],
              title: items[index]["title"],
              url: items[index]["url"],
            ),
          );
        },
      ),
    );
  }
}
