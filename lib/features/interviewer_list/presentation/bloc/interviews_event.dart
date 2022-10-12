part of 'interviews_bloc.dart';

abstract class InterviewsEvent extends Equatable {
  const InterviewsEvent();
  @override
  List<Object> get props => [];
}

class FetchInterviewerListEvent extends InterviewsEvent{}

class ToogleEvent extends InterviewsEvent{
  const ToogleEvent({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}


