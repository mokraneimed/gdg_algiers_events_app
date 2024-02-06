part of 'issue_cubit.dart';

@immutable
abstract class IssueState {}

class IssueInitial extends IssueState {}
class IssueLoading extends IssueState {}
class IssueSuccess extends IssueState {}
class IssueFailure extends IssueState {
  final String errorMessage;
  IssueFailure({
    required this.errorMessage,
  });
}
