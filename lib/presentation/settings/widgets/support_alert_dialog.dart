import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:gdg_algiers_events_app/presentation/settings/widgets/loadingWidget.dart';
import 'package:gdg_algiers_events_app/presentation/settings/widgets/supportElevatedButton.dart';
import 'package:gdg_algiers_events_app/presentation/settings/widgets/supportTextField.dart';
import '../../../constants/Colors.dart';
import '../../../logic/cubit/issue_cubit/issue_cubit.dart';
import '../support_page.dart';
import 'scrollingBehavior.dart';

class SupportAlertDialog extends StatefulWidget {
  final Errors? issue;
  const SupportAlertDialog({Key? key, required this.issue}) : super(key: key);

  @override
  State<SupportAlertDialog> createState() => _SupportAlertDialogState();
}

class _SupportAlertDialogState extends State<SupportAlertDialog> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool loading = false;
  String? fullName;
  String? email;
  String? description;
  String? issueType;

  @override
  Widget build(BuildContext context) {
    double mxLines = context.height * 0.008;
    int maxLines = mxLines.toInt();
    String elevatedButtonText = 'Submit Issue';
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: SizedBox(
              height: context.height * 0.7,
              width: context.height * 0.55,
              child: LayoutBuilder(
                builder: ((context, constraints) {
                  final widgetHeight = constraints.maxHeight;
                  final wdigetWidth = constraints.maxWidth;
                  return SizedBox(
                    height: widgetHeight,
                    width: wdigetWidth,
                    child: ListView(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Report Issue",
                            style: context.textTheme.titleMedium!.copyWith(
                              fontSize: context.height * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SupportTextField(
                                hint: "Full Name",
                                maxLines: 1,
                                maxLength: 1,
                                onSubmitted: (enteredKeyWord) {
                                  setState(() {
                                    fullName = enteredKeyWord;
                                  });
                                },
                              ),
                              SupportTextField(
                                hint: "E-mail",
                                maxLines: 1,
                                maxLength: 1,
                                onSubmitted: (enteredKeyWord) {
                                  setState(() {
                                    email = enteredKeyWord;
                                  });
                                },
                              ),
                              Visibility(
                                visible: widget.issue == Errors.Other,
                                child: SupportTextField(
                                  hint: "Issue-Type",
                                  maxLines: 1,
                                  maxLength: 1,
                                  onSubmitted: (enteredKeyWord) {
                                    setState(() {
                                      issueType = enteredKeyWord;
                                    });
                                  },
                                ),
                              ),
                              SupportTextField(
                                hint:
                                    "Please describe the issue you encountered...",
                                maxLines: maxLines,
                                maxLength: 100,
                                onSubmitted: (enteredKeyWord) {
                                  setState(() {
                                    description = enteredKeyWord;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            BlocConsumer<IssueCubit, IssueState>(
                              listener: (context, state) {
                                if (state is IssueLoading) {
                                  loading = true;
                                } else if (state is IssueSuccess) {
                                  showToast(message: 'Thanks for the feedback');
                                  loading = false;
                                  context.pop();
                                } else if (state is IssueFailure) {
                                  elevatedButtonText = 'Try again?';
                                  showToast(message: 'Something went wrong!');
                                  loading = false;
                                }
                              },
                              builder: (context, state) {
                                return loading
                                    ? const LoadingWidget()
                                    : SupportElevatedButton(
                                        onPressed: submitIssue,
                                        buttonText: elevatedButtonText,
                                        color: AppColors.kPrimaryColor,
                                      );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SupportElevatedButton(
                              onPressed: () => context.pop(),
                              buttonText: "Cancel",
                              color: AppColors.kPrimaryColor.withOpacity(0.75),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.kBlack54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void saveIssue() {
    if (formKey.currentState!.validate()) {
      switch (widget.issue) {
        case Errors.Bug:
          issueType = "Bug";
          break;
        case Errors.Can_not_find_events:
          issueType = "Cannot find events";
          break;
        case Errors.Spam:
          issueType = "Spam";
          break;
        default:
      }
    }
  }

  void submitIssue() async {
    saveIssue();
    await BlocProvider.of<IssueCubit>(context).postIssue(
      fullName: fullName,
      email: email,
      description: description,
      bugType: issueType,
    );
  }
}
