part of 'interviews_bloc.dart';

abstract class InterviewsState {
  const InterviewsState();

}

class EmptyState extends InterviewsState {}

class LoadingState extends InterviewsState {}

class ErrorState extends InterviewsState {
  const ErrorState({required this.message});
  final String message;

}

class LoadedState extends InterviewsState {
  const LoadedState(
      {required this.interviewList,
      required this.addedList,
      required this.buttonActiveStatus});

  final List<InterviewListEntity> addedList;
  final List<InterviewListEntity> interviewList;
  final bool buttonActiveStatus;
}
