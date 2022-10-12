import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/interview_list_entity.dart';
import '../../domain/use_cases/get_interview_list.dart';

part 'interviews_event.dart';
part 'interviews_state.dart';

class InterviewsBloc extends Bloc<InterviewsEvent, InterviewsState> {
  final GetInterviewListUseCase getInterviewListUseCase;
  List<InterviewListEntity> localList = [];
  List<InterviewListEntity> addedList = [];

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
          emit( LoadedState(
            buttonActiveStatus: _getButtonActiveStatus(),
            interviewList: localList,
            addedList: addedList,
          ));
        },
      );
    });

    on<ToogleEvent>((event, emit) async {
      // localList[event.index].isSelected = !localList[event.index].isSelected;
      localList[event.index].isSelected = !localList[event.index].isSelected;
      print(localList[event.index].isSelected);
      if (localList[event.index].isSelected) {
        final data = localList.elementAt(event.index);
        addedList.add(data);
      } else if (!localList[event.index].isSelected) {
        final data = localList.elementAt(event.index);
        addedList.remove(data);
      }
      print(localList[event.index].isSelected);
      return emit( LoadedState(
        buttonActiveStatus: _getButtonActiveStatus(),
        interviewList: localList,
        addedList: addedList,
      ));

    });
  }
}
