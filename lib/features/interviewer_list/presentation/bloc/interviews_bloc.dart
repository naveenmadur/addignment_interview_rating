import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/core/constants/qualities_list.dart';
import 'package:interview_app_clean_code/features/interviewer_list/domain/entities/quality_list_entity.dart';
import '../../../../core/constants/text_constants.dart';
import '../../domain/entities/interview_list_entity.dart';
import '../../domain/use_cases/get_interview_list.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/ratings_screen/widgets/rating_tile.dart';

part 'interviews_event.dart';
part 'interviews_state.dart';

class InterviewsBloc extends Bloc<InterviewsEvent, InterviewsState> {
  final GetInterviewListUseCase getInterviewListUseCase;
  List<InterviewListEntity> localList = [];
  List<InterviewListEntity> addedList = [];
  List<RatingTile> ratingTileList = [
    RatingTile(
      emoji: TextConstants.kClappingHands,
      title: 'Awesome',
      isSelected: true,
      index: 0,
    ),
    RatingTile(
      emoji: TextConstants.kThumbsUp,
      title: 'Good',
      isSelected: false,
      index: 1,
    ),
    RatingTile(
      emoji: TextConstants.kNeutralFace,
      title: 'Neutral',
      isSelected: false,
      index: 2,
    ),
    RatingTile(
      emoji: TextConstants.kFrowningFace,
      title: 'Bad',
      isSelected: false,
      index: 3,
    ),
  ];

  bool _getButtonActiveStatus() {
    if (addedList.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  InterviewsBloc({required this.getInterviewListUseCase})
      : super(EmptyState()) {
    on<FetchInterviewerListEvent>((event, emit) async {
      emit(LoadingState());
      final result = await getInterviewListUseCase.call();
      result.fold(
        (failure) {
          emit(ErrorState(message: failure.message));
        },
        (data) {
          localList = data;
          emit(LoadedState(
              buttonActiveStatus: _getButtonActiveStatus(),
              interviewList: localList,
              addedList: addedList,
              ratingTileList: ratingTileList));
        },
      );
    });

    on<ToogleEvent>((event, emit) async {
      localList[event.index].isSelected = !localList[event.index].isSelected;
      if (localList[event.index].isSelected) {
        final data = localList.elementAt(event.index);
        addedList.add(data);
      } else if (!localList[event.index].isSelected) {
        final data = localList.elementAt(event.index);
        addedList.remove(data);
      }
      return emit(LoadedState(
          buttonActiveStatus: _getButtonActiveStatus(),
          interviewList: localList,
          addedList: addedList,
          ratingTileList: ratingTileList));
    });

    on<NavigateToRatingsScreenEvent>((event, emit) {
      emit(LoadedState(
          interviewList: localList,
          addedList: addedList,
          buttonActiveStatus: _getButtonActiveStatus(),
          ratingTileList: ratingTileList));
    });

    on<RatingsScreenSelectEvent>((event, emit) {
      if (ratingTileList[event.index].isSelected) {
        ratingTileList[event.index].isSelected = false;
      } else {
        ratingTileList.forEach((element) {
          element.isSelected = false;
        });
        ratingTileList[event.index].isSelected = true;
      }

      emit(LoadedState(
          interviewList: localList,
          addedList: addedList,
          buttonActiveStatus: false,
          ratingTileList: ratingTileList));
    });

    on<NavigateToSubmitScreenEvent>((event, emit) {
      final RatingTile rating =
          ratingTileList.firstWhere((element) => element.isSelected == true);
      emit(SubmitScreenState(rating, qualityListEntity));
    });

    on<ToogleQualities>((event, emit) {
      final RatingTile rating =
          ratingTileList.firstWhere((element) => element.isSelected == true);
      qualityListEntity[event.index].isSelected =
          !qualityListEntity[event.index].isSelected;
      emit(SubmitScreenState(rating, qualityListEntity));
    });

    on<ResetEvent>((event, emit) {
      localList.forEach((element) {
        element.isSelected = false;
      });
      qualityListEntity.forEach((element) {
        element.isSelected = false;
      });
      addedList.clear();
      emit(LoadedState(
          interviewList: localList,
          addedList: addedList,
          buttonActiveStatus: _getButtonActiveStatus(),
          ratingTileList: ratingTileList));
    });

    on<GoBackEvent>((event, emit){
      add(ResetEvent());
      emit(LoadedState(
          interviewList: localList,
          addedList: addedList,
          buttonActiveStatus: _getButtonActiveStatus(),
          ratingTileList: ratingTileList));
    });
  }
}
