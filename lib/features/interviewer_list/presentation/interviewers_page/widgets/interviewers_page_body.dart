import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/core/constants/color_constants.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../bloc/interviews_bloc.dart';
import 'interview_list_tile.dart';
import 'progress_indicator.dart';
import 'search_bar.dart';

class InterviewersPageBody extends StatelessWidget {
  const InterviewersPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterviewsBloc, InterviewsState>(
      builder: (context, state) {
        if (state is EmptyState) {
          BlocProvider.of<InterviewsBloc>(context)
              .add(FetchInterviewerListEvent());
          return const CustomProgressIndicator();
        } else if (state is LoadingState) {
          return const CustomProgressIndicator();
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is LoadedState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SearchBar(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text('${state.addedList.length} Added', style: TextStyles.kAddedListLengthTextStyle,)),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: ((context, index) => InterviewListTile(
                        item: state.interviewList[index], index: index)),
                    itemCount: state.interviewList.length,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
