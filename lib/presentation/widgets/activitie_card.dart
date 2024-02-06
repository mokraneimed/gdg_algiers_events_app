import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';

class ActivitieCard extends StatelessWidget {
  final String name;
  final String mainImageURL;
  final String speaker; 
  final String comment; 

  const ActivitieCard({
    Key? key,
    required this.name,
    required this.mainImageURL,
    this.speaker = '',
    this.comment = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 3,
        minHeight: 100,
      ),
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            color: AppColors.kWhite,
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: mainImageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    constraints: const BoxConstraints(
                      minHeight: double.maxFinite,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.kWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          name,
                          style: context.textTheme.titleLarge!.copyWith(fontSize: 7,fontWeight: FontWeight.w600)
                        ),
                        Text(
                          (speaker != '')
                              ? 'By: ' + speaker
                              : comment,
                          style: context.textTheme.titleLarge!.copyWith(fontSize: 6,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
