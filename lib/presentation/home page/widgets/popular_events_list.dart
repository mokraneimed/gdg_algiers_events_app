import "package:flutter/material.dart";

import 'package:card_swiper/card_swiper.dart';

import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/classes/event.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/popular_event_slide.dart';

import '../../../models/event.dart';

class PopEventList extends StatelessWidget {
  const PopEventList({Key? key, required this.events}) : super(key: key);

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    List<PopularEventSlide> popularEvents = List.generate(
        events.length,
        (index) => PopularEventSlide(
              image: events[index].coverPhoto,
              location: events[index].location!,
              name: events[index].name!,
              onTap: () {},
            ));

    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 150,
          maxHeight: 200,
        ),
        child: Swiper(
          itemCount: popularEvents.length,
          itemBuilder: (context, index) => popularEvents[index],
          pagination: SwiperPagination(
            builder: SwiperCustomPagination(
              builder: ((context, config) {
                final List<Widget> list = [];
                final int itemCount = config.itemCount;
                for (var i = 0; i < itemCount; i++) {
                  final bool active = i == config.activeIndex;
                  list.add(
                    SizedBox(
                      height: 3,
                      width: active ? 20 : 10,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: active ? AppColors.kColor1 : AppColors.kColor2,
                        ),
                      ),
                    ),
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
