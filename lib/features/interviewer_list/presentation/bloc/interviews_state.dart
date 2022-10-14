// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  const LoadedState({
    required this.interviewList,
    required this.addedList,
    required this.buttonActiveStatus,
    required this.ratingTileList,

  });

  final List<InterviewListEntity> addedList;
  final List<InterviewListEntity> interviewList;
  final List<RatingTile> ratingTileList;
  final bool buttonActiveStatus;

}

class SubmitScreenState extends InterviewsState{
  SubmitScreenState(this.rating, this.qualities);
  final RatingTile rating;
  final List<QualityListEntity> qualities;
}

