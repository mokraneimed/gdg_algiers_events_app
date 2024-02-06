import "package:flutter/material.dart";

import "package:gdg_algiers_events_app/constants/extensions.dart";

import "../../../constants/colors.dart";

class newEvent extends StatelessWidget {
  const newEvent();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                top: 15, bottom: 4, left: screenSize.width * 0.06),
            child: Row(
              children: [
                Container(
                  child: Text(
                    'New Event Added - ',
                    style: context.textTheme.titleMedium!.copyWith(fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  child: Text(
                    'Flutter Festival',
                    style: context.textTheme.bodyLarge!.copyWith(fontSize: 12,color: AppColors.kPrimaryColor.withOpacity(0.75)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: screenSize.width * 0.06, right: screenSize.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 9),
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 12,
                            color: AppColors.kPrimaryColor.withOpacity(0.75),
                          )),
                      Container(
                        child: Text(
                          'Online',
                          style: context.textTheme.bodyLarge!.copyWith(fontSize: 12,color: AppColors.kPrimaryColor.withOpacity(0.75)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          child: Icon(
                        Icons.access_time_filled,
                        size: 12,
                        color: AppColors.kPrimaryColor.withOpacity(0.75),
                      )),
                      Container(
                        margin: const EdgeInsets.only(left: 9),
                        child: Text('01 avril 2022',
                            style: context.textTheme.bodyLarge!.copyWith(fontSize: 12,color: AppColors.kPrimaryColor.withOpacity(0.75))),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
