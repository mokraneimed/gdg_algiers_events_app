import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';
import '../../constants/Theme.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kWhite,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Terms Of Service",
                    textAlign: TextAlign.left,
                    style: context.textTheme.titleLarge),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Here we have some Rules.",
                    textAlign: TextAlign.left,
                    style:  context.textTheme.bodySmall!.copyWith(fontSize: 12,color: AppColors.kPrimaryColor.withOpacity (0.75))),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(''' Welcome to GDG Event App!
This section presents our relationship with you. It contains a description of the service, defines the contract which links us and identifies the entity which provides you with the service.

Who can use the service?
This section defines some of the criteria necessary to use the service, as well as the different user categories.

Your use of the service
This section describes your rights as part of the use of the service, as well as the conditions that apply to your use of the service. It also explains the conditions under which we are likely to modify the service.

Who can use the service?
This section defines some of the criteria necessary to use the service, as well as the different user categories.

Welcome to GDG Event App!
This section presents our relationship with you. It contains a description of the service, defines the contract which links us and identifies the entity which provides you with the service.

Who can use the service?
This section defines some of the criteria necessary to use the service, as well as the different user categories.

Your use of the service
This section describes your rights as part of the use of the service, as well as the conditions that apply to your use of the service. It also explains the conditions under which we are likely to modify the service.

Who can use the service?
This section defines some of the criteria necessary to use the service, as well as the different user categories.''',
                      style: context.textTheme.bodyLarge),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
