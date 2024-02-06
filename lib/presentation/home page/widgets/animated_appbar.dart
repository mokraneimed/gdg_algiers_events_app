import 'dart:math';

import 'package:flutter/material.dart';

import "package:flutter_svg/flutter_svg.dart";

import 'package:gdg_algiers_events_app/constants/colors.dart';
import "package:gdg_algiers_events_app/constants/colors.dart";
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import "package:gdg_algiers_events_app/constants/routes.dart";

import '../../../constants/social_media_links.dart';

class AnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AnimatedAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  double width = 50;
  bool on = true;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      leadingWidth: 12,
      leading: const SizedBox(
        width: 0,
      ),
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 15,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (on) {
                  setState(
                    () {
                      width = min(MediaQuery.of(context).size.width * 0.8, 300);
                    },
                  );
                } else {
                  setState(
                    () {
                      width = 50;
                    },
                  );
                }
                on = !on;
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  "assets/photos/gdgLogo.png",
                ),
              ),
            ),
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: getInstagram,
                    icon: SvgPicture.asset(
                      "assets/icons/instagram.svg",
                      color: AppColors.kGreyColor,
                    ),
                  ),
                  const IconButton(
                    onPressed: getFacebook,
                    icon: Icon(
                      Icons.facebook,
                      color: AppColors.kGreyColor,
                      size: 30,
                    ),
                  ),
                  const IconButton(
                    onPressed: getDiscord,
                    icon: Icon(
                      Icons.discord,
                      color: AppColors.kGreyColor,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: getLinkedin,
                    icon: SvgPicture.asset(
                      "assets/icons/linkedin.svg",
                      color: AppColors.kGreyColor,
                      height: 22,
                      width: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: getTwitter,
                    icon: SvgPicture.asset(
                      "assets/icons/twitter.svg",
                      color: AppColors.kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.kSettings);
          },
          icon: SvgPicture.asset("assets/icons/settings.svg"),
          color: AppColors.kPrimaryColor,
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
