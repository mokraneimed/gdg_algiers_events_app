import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

import '../widgets/background.dart';
import '../../constants/Theme.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int currentIndex = 1;

    return SafeArea(
      child: BackgroundImage(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: screenSize.width * 0.12,
                    top: screenSize.height * 0.09),
                width: screenSize.width,
                child: Text(
                  'Notifications',
                  style: context.textTheme.titleLarge,
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  width: screenSize.width,
                  height: screenSize.height - screenSize.height * 0.27,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Container(
                        width: screenSize.width * 0.8,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(128, 0, 0, 0),
                                  blurRadius: 6,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0.2)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.kWhite),
                        height: 75,
                        margin: EdgeInsets.only(
                            top: 20,
                            left: screenSize.width * 0.07,
                            right: screenSize.width * 0.07),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 15,
                                  bottom: 4,
                                  left: screenSize.width * 0.06),
                              child: Row(
                                children: [
                                  Text(
                                    'New Event Added',
                                    style: context.textTheme.titleLarge!.copyWith(fontSize: 16,fontWeight:FontWeight.w600,color: AppColors.kPrimaryColor.withOpacity(0.75) ),
     
                                  ),
                                  Text(
                                    ' - ',
                                    style: context.textTheme.titleLarge!.copyWith(fontSize: 16,fontWeight:FontWeight.w600,color: AppColors.kPrimaryColor.withOpacity(0.75) ),
                                  ),
                                  Text(
                                    'Flutter Festival',
                                    style: context.textTheme.titleLarge!.copyWith(fontSize: 10,fontWeight:FontWeight.w500,color: AppColors.kPrimaryColor.withOpacity(0.75) ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  left: screenSize.width * 0.06,
                                  right: screenSize.width * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 9),
                                        child: Icon(
                                          Icons.location_on_rounded,
                                          size: 9,
                                          color: AppColors.kPrimaryColor
                                              .withOpacity(0.75),
                                        ),
                                      ),
                                      Text(
                                        'Online',
                                        style: context.textTheme.titleLarge!.copyWith(fontSize: 8,fontWeight:FontWeight.w400,color: AppColors.kPrimaryColor.withOpacity(0.75) ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled,
                                        size: 9,
                                        color: AppColors.kPrimaryColor
                                            .withOpacity(0.75),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 9),
                                        child: Text(
                                          '01 avril 2022',
                                          style: context.textTheme.titleLarge!.copyWith(fontSize: 8,fontWeight:FontWeight.w400,color: AppColors.kPrimaryColor.withOpacity(0.75) ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
