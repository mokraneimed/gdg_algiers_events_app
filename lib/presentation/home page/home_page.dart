import 'dart:math';

import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gdg_algiers_events_app/constants/Theme.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/constants/social_media_links.dart';
import 'package:gdg_algiers_events_app/logic/cubit/event_cubit/events_cubit.dart';
import 'package:gdg_algiers_events_app/logic/cubit/event_cubit/events_searched_cubit.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/animated_appbar.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/event_card.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/popular_event_slide.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/popular_events_list.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/widgets/search_bar.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';

import '../../constants/fonts.dart';
import '../../constants/routes.dart';

import '../../logic/cubit/event_cubit/events_searched_state.dart';
import 'classes/event.dart';
import "widgets/event_list.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // The AppBar uses the app-default Raleway font.
        appBar: const AnimatedAppBar(),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Are You Ready ?",
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              const CustomSearchBar(),
              Expanded(
                child: BlocBuilder<EventsSearchedCubit, EventsSearchedState>(
                    builder: (context, state) {
                  if (state is EventsSearchedInitial) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const EventList(),
                        const SizedBox(height: 10),
                        Text(
                          "Popular Events",
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        BlocBuilder<EventsCubit, EventsState>(
                          builder: (context, state) {
                            if (state is EventsLoaded) {
                              return PopEventList(events: state.eventsList);
                            }
                            if (state is EventsLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (state is EventsError) {
                              return const Center(child: Text("Error"));
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ],
                    );
                  }
                  if (state is EventsSearchedLoaded) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return PopularEventSlide(
                                    location: state.eventsList[index].location!,
                                    name: state.eventsList[index].name!,
                                    onTap: () {});
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: state.eventsList.length),
                        ),
                      ],
                    );
                  }
                  if (state is EventsSearchedError) {
                    return const Center(child: Text("Error"));
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
