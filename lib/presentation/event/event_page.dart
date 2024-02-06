import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';

import '../../constants/Theme.dart';
import '../../constants/routes.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Stack(
                //Hero image
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kPrimaryColor, //color of shadow
                          spreadRadius: 1.0, //spread radius
                          blurRadius: 60, // blur radius
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image:
                            'https://i.ibb.co/chcm72K/devfest-main-Image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: BackButton(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              //body
              flex: 3,
              fit: FlexFit.tight,
              child: BackgroundImage(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        //Header
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            //title
                            'DevFest 21',
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Transform.translate(
                              offset: Offset.fromDirection(pi, 2.0),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.location_on,
                                      color: AppColors.kTextColor,
                                      size: 22.0,
                                    ),
                                  ),
                                  Text(
                                    'Altius Services Bir Morad Rais',
                                    style: context.textTheme.labelMedium!
                                        .copyWith(
                                            color: AppColors.kTextColor,
                                            fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.access_time_filled,
                                    color: AppColors.kTextColor,
                                    size: 18.0,
                                  ),
                                ),
                                Text(
                                  '17 May 2022',
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    fontSize: 12,
                                    color: AppColors.kPrimaryColor
                                        .withOpacity(0.75),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
                          's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          //butn
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  context.pushNamed(Routes.kEventDetails),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.kPrimaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 30,
                                  ),
                                  child: Text(
                                    'More Details',
                                    style: context.textTheme.labelMedium,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
