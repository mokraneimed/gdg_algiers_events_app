import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';

class AlbumsListItem extends StatelessWidget {
  final String urlImage, title;

  const AlbumsListItem({
    Key? key,
    required this.urlImage,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          getImage(urlImage),
          // getBlur(),
          getGradientFilter(),
          getIcon('assets/icons/images_album.svg'),
          getTitle()
        ],
      ),
    );
  }

  Widget getImage(String imgPath) {
    return Container(
      width: 242,
      height: 155,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getBlur() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8)),
      ),

      // child: Container(
      //   decoration: BoxDecoration(
      //       color: Colors.transparent.withOpacity(0.05),
      //       borderRadius: BorderRadius.circular(8)
      //   ),
      // ),
    );
  }

  Widget getGradientFilter() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.1),
              AppColors.kColor4.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  Widget getIcon(String iconPath) {
    return const Positioned(
      top: 61,
      left: 105,
      child: Icon(Icons.image, size: 31, color: Colors.white), //temporary
      // child: SvgPicture.asset(
      //   iconPath,
      //   width: 31,
      //   height: 31,
      // ),
    );
  }

  Widget getTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 124, left: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
