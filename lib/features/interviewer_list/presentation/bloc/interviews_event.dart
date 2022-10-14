// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'interviews_bloc.dart';

abstract class InterviewsEvent {
  const InterviewsEvent();
}

class FetchInterviewerListEvent extends InterviewsEvent {}

class ToogleEvent extends InterviewsEvent {
  const ToogleEvent({required this.index});
  final int index;
}

class NavigateToRatingsScreenEvent extends InterviewsEvent {}

class RatingsScreenSelectEvent extends InterviewsEvent {
  RatingsScreenSelectEvent({required this.index});
  final int index;
}

class NavigateToSubmitScreenEvent extends InterviewsEvent {}

class ToogleQualities extends InterviewsEvent {
  final int index;
  ToogleQualities({
    required this.index,
  });
}

class ResetEvent extends InterviewsEvent{}
