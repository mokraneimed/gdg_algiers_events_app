import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../constants/endpoints.dart';
import '../../networking/dio_helper/dio_helper.dart';

part 'issue_state.dart';

class IssueCubit extends Cubit<IssueState> {
  IssueCubit() : super(IssueInitial());

  Future<void> postIssue(
      {required fullName,
      required email,
      required description,
      required bugType}) async {
    try {
      emit(IssueLoading());

      final response =
          await DioHelper.postData(url: '$baseUrl/issues/add', data: {
        "senderFullName": fullName,
        "senderMail": email,
        "description": description,
        "type": bugType,
      });
      if (response.statusCode == 201) {
        emit(IssueSuccess());
      } else {
        emit(IssueFailure(
            errorMessage: "The status code is : ${response.statusCode}"));
      }
    } catch (e) {
      emit(IssueFailure(errorMessage: e.toString()));
    }
  }
}
