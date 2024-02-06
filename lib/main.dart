import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gdg_algiers_events_app/constants/Theme.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/logic/app_router/app_router.dart';
import 'package:gdg_algiers_events_app/logic/cubit/bloc_observer.dart';
import 'package:gdg_algiers_events_app/logic/cubit/event_cubit/events_cubit.dart';
import 'package:gdg_algiers_events_app/logic/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:gdg_algiers_events_app/logic/cubit/navigation_cubit/navigation_state.dart';
import 'package:gdg_algiers_events_app/logic/networking/cache_helper/cache_helper.dart';
import 'package:gdg_algiers_events_app/logic/networking/dio_helper/dio_helper.dart';
import 'package:gdg_algiers_events_app/presentation/introduction%20screen/intro_slide_show.dart';

import 'logic/cubit/issue_cubit/issue_cubit.dart';
import 'logic/cubit/event_cubit/events_searched_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  bool? startFromOnBoarding = CacheHelper.getBoolean(key: 'onBoarding');
  AppRouter appRouter = AppRouter();

  runApp(
    MyApp(
      appRouter: appRouter,
      startFromOnBoarding: startFromOnBoarding ?? true,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool startFromOnBoarding;

  const MyApp({
    required this.appRouter,
    required this.startFromOnBoarding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit()
            ..changeOnBoarding(
              fromShared: startFromOnBoarding,
            ),
        ),
        BlocProvider(create: (context) => EventsCubit()..getEvents()),
        BlocProvider(create: (context) => IssueCubit()),
        BlocProvider(create: (context) => EventsSearchedCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        onGenerateRoute: appRouter.onGenerateRoute,
        home: BlocConsumer<NavigationCubit, NavigationState>(
          listener: (context, state) {},
          builder: (context, state) {
            NavigationCubit navigationCubit =
                BlocProvider.of<NavigationCubit>(context);
            return navigationCubit.startFromOnBoarding == true
                ? const IntroSlideShow()
                : Scaffold(
                    bottomNavigationBar: BottomNavigationBar(
                      elevation: 10,
                      selectedItemColor: AppColors.kPrimaryColor,
                      unselectedItemColor: AppColors.kGrey,
                      onTap: (index) {
                        navigationCubit.changeIndex(index);
                      },
                      currentIndex: navigationCubit.currentIndex,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                          ),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.calendar_today,
                          ),
                          label: "Agenda",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.camera,
                          ),
                          label: "Recap",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.notifications_active,
                          ),
                          label: "Notifications",
                        ),
                      ],
                    ),
                    body: Center(
                      child: IndexedStack(
                        index: navigationCubit.currentIndex,
                        children: navigationCubit.screens,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
