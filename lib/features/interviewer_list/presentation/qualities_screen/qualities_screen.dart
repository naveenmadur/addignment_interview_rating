import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/core/constants/color_constants.dart';
import 'package:interview_app_clean_code/core/constants/text_styles.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/qualities_screen/widgets/qualities.dart';
import '../../../../core/constants/text_constants.dart';
import '../bloc/interviews_bloc.dart';
import 'widgets/qualities_screen_next_button.dart';

class QualitiesScreen extends StatelessWidget {
  const QualitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InterviewsBloc, InterviewsState>(
        builder: (context, state) {
          if (state is SubmitScreenState) {
            var quality = state.qualities;
            Text getTitle() {
              if (state.rating.title == 'Awesome') {
                return TextConstants.kRatingTileEnableAwesomeTitle;
              } else if (state.rating.title == 'Good') {
                return TextConstants.kRatingTileEnableGoodTitle;
              } else if (state.rating.title == 'Neutral') {
                return TextConstants.kRatingTileEnableNeutralTitle;
              } else {
                return TextConstants.kRatingTileEnableBadTitle;
              }
            }

            Text getSubtitle() {
              if (state.rating.title == 'Awesome') {
                return TextConstants.kRatingTileEnableAwesomeSubtitle;
              } else if (state.rating.title == 'Good') {
                return TextConstants.kRatingTileEnableGoodSubtitle;
              } else if (state.rating.title == 'Neutral') {
                return TextConstants.kRatingTileEnableNeutralSubtitle;
              } else {
                return TextConstants.kRatingTileEnableBadSubtitle;
              }
            }

            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 60, bottom: 30, left: 14, right: 14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: ColorConstants.kGrey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('You have rated your interviewer'),
                      const SizedBox(
                        height: 14,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: ColorConstants.kSelectedContainerColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: state.rating.emoji,
                            title: getTitle(),
                            subtitle: getSubtitle(),
                            trailing: const Text(
                              'CHANGE',
                              style: TextStyles.kTrailingTextStyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      const Text('What made the interviewers awesome?',
                          style: TextStyle(fontSize: 25)),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Qualities(
                              quality: quality[0].qualityName,
                              isSelected: quality[0].isSelected,
                              index: 0),
                          const SizedBox(
                            width: 20,
                          ),
                          Qualities(
                              quality: quality[1].qualityName,
                              isSelected: quality[1].isSelected,
                              index: 1),
                        ],
                      ),
                      Row(
                        children: [
                          Qualities(
                              quality: quality[2].qualityName,
                              isSelected: quality[2].isSelected,
                              index: 2),
                          const SizedBox(
                            width: 20,
                          ),
                          Qualities(
                              quality: quality[3].qualityName,
                              isSelected: quality[3].isSelected,
                              index: 3),
                        ],
                      ),
                      Row(
                        children: [
                          Qualities(
                              quality: quality[4].qualityName,
                              isSelected: quality[4].isSelected,
                              index: 4),
                          const SizedBox(
                            width: 20,
                          ),
                          Qualities(
                              quality: quality[5].qualityName,
                              isSelected: quality[5].isSelected,
                              index: 5),
                        ],
                      ),
                      Row(children: [
                        Qualities(
                            quality: quality[6].qualityName,
                            isSelected: quality[6].isSelected,
                            index: 6),
                      ])
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Text('');
          }
        },
      ),
      floatingActionButton: const QualitiesScreenSubmitButton(),
    );
  }
}
