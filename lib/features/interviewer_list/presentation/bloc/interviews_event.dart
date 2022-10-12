part of 'interviews_bloc.dart';

abstract class InterviewsEvent{
  const InterviewsEvent();
}

class FetchInterviewerListEvent extends InterviewsEvent{}

class ToogleEvent extends InterviewsEvent{
  const ToogleEvent({required this.index});
  final int index;
}


