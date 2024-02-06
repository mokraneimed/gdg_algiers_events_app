import 'package:flutter/material.dart';

import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

import '../../../constants/Routes.dart';
import '../../../constants/Theme.dart';
import '../../../models/event.dart';
import '../classes/event.dart';

class EventCard extends StatefulWidget {
  final String name;
  final String location;
  final String image;
  final Function onTap;
  const EventCard({
    Key? key,
    required this.location,
    required this.name,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  factory EventCard.fromEvent(Event e, Function onTap) {
    return EventCard(
      location: e.location!,
      name: e.name!,
      image: e.coverPhoto!,
      onTap: onTap,
    );
  }
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.kEventDetails,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 1,
        ),
        width: MediaQuery.of(context).size.width * 0.78,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.kBlack,
              blurRadius: 1,
              spreadRadius: 0,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  color: AppColors.kWhite.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(1.5, 0),
                        child: Text(
                          widget.name,
                          style: context.textTheme.titleLarge!
                              .copyWith(fontSize: 12),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.kGreyColor,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              widget.location,
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontSize: 12,
                                color:
                                    AppColors.kPrimaryColor.withOpacity(0.75),
                              ),
                            ),
                          ),
                        ],
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
