import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_algiers_events_app/logic/networking/cache_helper/cache_helper.dart';
import 'package:gdg_algiers_events_app/presentation/agenda/agenda.dart';
import 'package:gdg_algiers_events_app/presentation/home%20page/home_page.dart';
import '../../../presentation/notifications/notfication_page.dart';
import '../../../presentation/recaps/recaps_page.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  static NavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool startFromOnBoarding = false;

  List<Widget> screens = [
    const HomePage(),
    const Agenda(),
    const RecapsPage(),
    const NotificationsPage()
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(NavigationChangeIndex());
  }

  void changeOnBoarding({bool? fromShared}) {
    if (fromShared != null) {
      startFromOnBoarding = fromShared;
      emit(NavigationOnBoarding());
    } else {
      startFromOnBoarding = !startFromOnBoarding;
      CacheHelper.putBoolean(key: 'onBoarding', value: startFromOnBoarding).then((value) {
        emit(NavigationOnBoarding());
      });
    }
  }
}
