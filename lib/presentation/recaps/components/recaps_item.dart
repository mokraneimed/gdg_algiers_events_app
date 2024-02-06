import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/recaps/components/video_player.dart';

import '../../../constants/colors.dart';

class RecapsItem extends StatefulWidget {
  final String imageLink, title, url;

  const RecapsItem({
    Key? key,
    required this.imageLink,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<RecapsItem> createState() => _RecapsItemState();
}

class _RecapsItemState extends State<RecapsItem> {
  late String play = "false";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: play == "false" ? getThumbnail() : VideoPlayer(url: widget.url),
      ),
      onTap: () {
        setState(() {
          play = "true";
        });
      },
    );
  }

  Widget getThumbnail() {
    return Stack(
      children: [
        getImage(),
        // getBlur(),
        getGradientFilter(),
        getIcon('assets/icons/Play.svg'),
        getTitle(),
      ],
    );
  }

  Widget getImage() {
    return Container(
      width: 306,
      height: 196,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.imageLink),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getBlur() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget getGradientFilter() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFFFFFFF).withOpacity(0.1),
                AppColors.kColor4.withOpacity(0.6),
              ]),
        ),
      ),
    );
  }

  Widget getIcon(String iconPath) {
    return const Positioned(
      top: 78.0,
      left: 133.0,
      child: Icon(
        Icons.play_arrow,
        size: 40,
        color: Colors.white,
      ), // tmeporary

      // child: SvgPicture.asset(
      //   iconPath,
      //   width: 40.0,
      //   height: 40.0,
      // ),
    );
  }

  Widget getTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 157, left: 13),
      child: Text(
        widget.title,
        style: context.textTheme.labelMedium!.copyWith(color: AppColors.kWhite,fontWeight: FontWeight.bold,fontSize: 13),
      ),
    );
  }
}
