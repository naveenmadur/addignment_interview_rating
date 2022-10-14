import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/core/constants/color_constants.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/ratings_screen/widgets/ratings_screen_next_button.dart';
import '../bloc/interviews_bloc.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kGrey,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorConstants.kGrey,
                child: const Text(
                  'How would you rate your interviewer(s)?',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Select your ratings'),
              ),
              BlocBuilder<InterviewsBloc, InterviewsState>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    return Expanded(
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 1 / 1.3,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        shrinkWrap: true,
                        children: [
                          state.ratingTileList[0],
                          state.ratingTileList[1],
                          state.ratingTileList[2],
                          state.ratingTileList[3],
                        ],
                      ),
                    );
                  } else {
                    return const Text('');
                  }
                },
              )
            ]),
      ),
      floatingActionButton: const RatingsScreenNextButton(),
    );
  }
}
