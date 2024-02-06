import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/Theme.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/recaps/components/albums_item.dart';

class Albums extends StatefulWidget {
  const Albums({Key? key}) : super(key: key);

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List items = [
    {
      "url": "assets/photos/all t-2-2.jpg",
      "title": "Ramdhan Iftar",
    },
    {
      "url":
          "assets/photos/49053176_2283474741670938_3644168184585519104_n.jpg",
      "title": "Welcome Day ",
    },
    {
      "url":
          "assets/photos/87122576_3156782167673520_1194230452815134720_n.jpg",
      "title": "Hashcode Event",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSectionTitle(),
          const SizedBox(
            height: 16,
          ),
          getAlbumsList(),
        ],
      ),
    );
  }

  Widget getSectionTitle() {
    return Text(
      'Albums',
      style: context.textTheme.titleMedium,
    );
  }

  Widget getAlbumsList() {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => const SizedBox(
          width: 24,
        ),
        itemBuilder: (context, index) {
          return AlbumsListItem(
            urlImage: items[index]["url"],
            title: items[index]["title"],
          );
        },
      ),
    );
  }
}
