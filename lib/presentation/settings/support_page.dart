//* stateful widget
import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/colors.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/settings/widgets/bugTile.dart';
import 'package:gdg_algiers_events_app/presentation/settings/widgets/supportElevatedButton.dart';
import 'package:gdg_algiers_events_app/presentation/settings/widgets/supportTextWidget.dart';

import 'package:gdg_algiers_events_app/presentation/widgets/background.dart';

import 'widgets/support_alert_dialog.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);
  @override
  State<SupportPage> createState() => _SupportPageState();
}

enum Errors { Bug, Spam, Can_not_find_events, Other }

class _SupportPageState extends State<SupportPage> {
  Errors? _error = Errors.Bug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SupportText(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IssueTile(
                    issueTitle: "Bug",
                    groupValue: _error,
                    onChanged: chooseIssue,
                    value: Errors.Bug,
                  ),
                  IssueTile(
                    issueTitle: "Spam",
                    groupValue: _error,
                    onChanged: chooseIssue,
                    value: Errors.Spam,
                  ),
                  IssueTile(
                    issueTitle: "Cannot find events",
                    groupValue: _error,
                    onChanged: chooseIssue,
                    value: Errors.Can_not_find_events,
                  ),
                  IssueTile(
                    issueTitle: "Other",
                    groupValue: _error,
                    onChanged: chooseIssue,
                    value: Errors.Other,
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SupportElevatedButton(onPressed: showReportIssueDialog, buttonText:"Report Issue",color: AppColors.kPrimaryColor,),
                    const SizedBox(height: 15),
                    SupportElevatedButton(onPressed: ()=>Navigator.of(context).pop(), buttonText:"Cancel",color: AppColors.kPrimaryColor.withOpacity(0.75),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void chooseIssue(Errors? value) {
    setState(() {
      _error = value;
    });
  }

  showReportIssueDialog() {
    showDialog(
      context: context,
      builder: (context) => SupportAlertDialog(
        issue: _error,
      ),
    );
  }
}
