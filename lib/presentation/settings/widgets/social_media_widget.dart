import "package:flutter/material.dart";
import "package:gdg_algiers_events_app/constants/Theme.dart";
import "package:gdg_algiers_events_app/constants/colors.dart";
import "package:gdg_algiers_events_app/constants/social_media_links.dart";
import 'package:flutter_svg/flutter_svg.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia();

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }
}
