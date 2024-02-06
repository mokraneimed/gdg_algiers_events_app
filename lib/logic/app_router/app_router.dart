import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/logic/app_router/widgets/custom_animation_builder.dart';
import 'package:gdg_algiers_events_app/presentation/agenda/agenda.dart';
import 'package:gdg_algiers_events_app/presentation/event/event_details.dart';
import 'package:gdg_algiers_events_app/presentation/event/event_page.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/home_page.dart';
import 'package:gdg_algiers_events_app/presentation/introduction%20screen/intro_slide_show.dart';
import 'package:gdg_algiers_events_app/presentation/notifications/notfication_page.dart';
import 'package:gdg_algiers_events_app/presentation/recaps/recaps_page.dart';
import 'package:gdg_algiers_events_app/presentation/settings/community_guidelines_page.dart';
import 'package:gdg_algiers_events_app/presentation/settings/notification_settings_page.dart';
import 'package:gdg_algiers_events_app/presentation/settings/settings_page.dart';
import 'package:gdg_algiers_events_app/presentation/settings/support_page.dart';
import 'package:gdg_algiers_events_app/presentation/settings/terms_of_service_page.dart';
import '../../constants/routes.dart';
import 'widgets/dafault_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.arguments != null) {
      final Map<String, dynamic> args =
          routeSettings.arguments as Map<String, dynamic>;
    }
    switch (routeSettings.name) {
      case Routes.kRoot:
        return buildScreen(
          screen: const HomePage(),
        );
      case Routes.kAgenda:
        return buildScreen(
          screen: const Agenda(),
        );
      case Routes.kRecaps:
        return buildScreen(
          screen: const RecapsPage(),
        );
      case Routes.kNotifPage:
        return buildScreen(
          screen: const NotificationsPage(),
        );
      case Routes.kEvent:
        return buildScreen(
          screen: const EventPage(),
        );
      case Routes.kEventDetails:
        return buildScreen(
          screen: EventDetails(),
        );
      case Routes.kIntroSlideShow:
        return buildScreen(
          screen: const IntroSlideShow(),
        );
      case Routes.kSettings:
        return buildScreen(
          screen: const SettingsPage(),
        );
      case Routes.kSupport:
        return buildScreen(
          screen: const SupportPage(),
        );
      case Routes.kTermsOfService:
        return buildScreen(
          screen: const TermsOfServicePage(),
        );
      case Routes.kNotifSettings:
        return buildScreen(
          screen: const NotificationSettingsPage(),
        );
      case Routes.kCommunityGuideLine:
        return buildScreen(
          screen: const CommunityGuidlinePage(),
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const DefaultScreen();
          },
        );
    }
  }
}
