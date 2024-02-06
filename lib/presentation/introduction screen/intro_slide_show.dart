import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/logic/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:gdg_algiers_events_app/logic/cubit/navigation_cubit/navigation_state.dart';
import 'package:gdg_algiers_events_app/logic/networking/cache_helper/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/Theme.dart';

class IntroSlideShow extends StatefulWidget {
  const IntroSlideShow({Key? key}) : super(key: key);

  @override
  State<IntroSlideShow> createState() => _IntroSlideShowState();
}

class _IntroSlideShowState extends State<IntroSlideShow> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/photos/devfest21.jpg',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: AppColors.kTransparent,
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/photos/iwd22.jpg',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: AppColors.kTransparent,
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/photos/smth.jpg',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                left: screenSize.width * 0.8, top: screenSize.height * 0.85),
            child: BlocConsumer<NavigationCubit, NavigationState>(
              listener: (context, state) {},
              builder: (context, state) {
                NavigationCubit cubit = NavigationCubit.get(context);
                return ElevatedButton(
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn);
                    if (_controller.page == 2) {
                      cubit.changeOnBoarding(
                        fromShared: CacheHelper.getBoolean(key: 'onBoarding'),
                      );
                    }
                    print(_controller.page);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor('#FFFFFF').withOpacity(0.1),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    size: 20,
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenSize.height * 0.63),
            height: screenSize.height * 0.25,
            width: screenSize.width,
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: const Alignment(-0.8, 0),
                      child: SmoothPageIndicator(
                        effect: SlideEffect(
                          dotColor: AppColors.kWhite.withOpacity(0.5),
                          activeDotColor: AppColors.kWhite,
                          dotHeight: 6,
                          spacing: 4,
                          dotWidth: 10,
                        ),
                        controller: _controller,
                        count: 3,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.8, 0),
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(128, 0, 0, 0),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                              spreadRadius: 1)
                        ]),
                        height: 40,
                        child: Text(
                          'GDG',
                          textAlign: TextAlign.left,
                          style: context.textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: AppColors.kWhite.withOpacity(0.65)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.6, 0),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(128, 0, 0, 0),
                                blurRadius: 10,
                                offset: Offset(0, 0),
                                spreadRadius: 1)
                          ],
                        ),
                        height: 45,
                        child: Text(
                          'lorem ipsum',
                          style: context.textTheme.titleLarge!
                              .copyWith(fontSize: 35, color: AppColors.kWhite),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.8, 0),
                      child: Container(
                        margin: EdgeInsets.only(left: screenSize.width * 0.1),
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia',
                          style: context.textTheme.titleLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColors.kWhite.withOpacity(0.65),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
