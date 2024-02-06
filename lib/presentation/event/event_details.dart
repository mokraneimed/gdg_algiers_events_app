import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';

import '../../models/activitie.dart';
import '../widgets/activitie_card.dart';

import 'widgets/customBackButton.dart';

class EventDetails extends StatelessWidget {
  EventDetails({Key? key}) : super(key: key);
  final List itemsData = [1, 2, 3, 4, 5];
  final int topContainer = 1;

  final List<Activitie> activities = [
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani'),
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani'),
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani')
  ];
  final List<Activitie> conferences = [
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani'),
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani'),
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani')
  ];
  final List<Activitie> workshops = [
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani'),
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani'),
    Activitie(
        name: "How Does Artificial Intelligence Affect UX Design",
        mainImageURL: 'https://i.ibb.co/xshYTNc/devfest-conference1.jpg',
        speaker: 'Yousra Ferhani')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundImage(child: SizedBox.shrink()),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0,
                    ),
                    child: CustomBackButton(
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      //Header
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          //title
                          'DevFest 21',
                          style: context.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 30.0),
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
                                style: context.textTheme.bodyLarge!.copyWith(
                                  fontSize: 12,
                                  color:
                                      AppColors.kPrimaryColor.withOpacity(0.75),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 30.0, left: 30.0),
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
                                      .withOpacity(0.75)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Conferences',
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 180.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: activities.map(
                              (activity) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ActivitieCard(
                                      name: activity.name,
                                      mainImageURL: activity.mainImageURL,
                                      speaker: activity.speaker,
                                    );
                                  },
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Activities',
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 180.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: activities.map(
                              (activity) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ActivitieCard(
                                      name: activity.name,
                                      mainImageURL: activity.mainImageURL,
                                      speaker: activity.speaker,
                                    );
                                  },
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Workshops',
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 180.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: activities.map(
                              (activity) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ActivitieCard(
                                      name: activity.name,
                                      mainImageURL: activity.mainImageURL,
                                      speaker: activity.speaker,
                                    );
                                  },
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
