import 'package:flutter/material.dart';

import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';

import '../../constants/Theme.dart';

class CommunityGuidlinePage extends StatelessWidget {
  const CommunityGuidlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 38.0,
          color: AppColors.kPrimaryColor,
        ),
      ),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Community Guidelines",
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                  "Here we have a description about the construction of the club in general and some rules in our events.",
                  style: context.textTheme.bodyLarge!.copyWith(fontSize: 12,color: AppColors.kPrimaryColor.withOpacity(0.75))),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type  Who can use the service? This section defines some of the criteria necessary to use the service, as well as the different user categories.''',
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
