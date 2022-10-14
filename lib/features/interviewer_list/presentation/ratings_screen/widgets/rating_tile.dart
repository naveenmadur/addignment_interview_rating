import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/core/constants/color_constants.dart';
import 'package:interview_app_clean_code/core/constants/text_constants.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/bloc/interviews_bloc.dart';

class RatingTile extends StatelessWidget {
  RatingTile(
      {Key? key,
      required this.emoji,
      required this.title,
      required this.isSelected,
      required this.index})
      : super(key: key);
  final Text emoji;
  bool isSelected = false;
  final int index;
  final String title;

  Text getTitle(bool isEnable) {
    if (isEnable) {
      if (title == 'Awesome') {
        return TextConstants.kRatingTileEnableAwesomeTitle;
      } else if (title == 'Good') {
        return TextConstants.kRatingTileEnableGoodTitle;
      } else if (title == 'Neutral'){
        return TextConstants.kRatingTileEnableNeutralTitle;
      }else{
        return TextConstants.kRatingTileEnableBadTitle;
      }
    } else {
      if (title == 'Awesome') {
        return TextConstants.kRatingTileDisableAwesomeTitle;
      } else if (title == 'Good') {
        return TextConstants.kRatingTileDisableGoodTitle;
      } else if (title == 'Neutral') {
        return TextConstants.kRatingTileDisableNeutralTitle;
      } else {
        return TextConstants.kRatingTileDisableBadTitle;
      }
    }
  }

  Text getSubtitle(bool isEnable) {
    if (isEnable) {
      if (title == 'Awesome') {
        return TextConstants.kRatingTileEnableAwesomeSubtitle;
      } else if (title == 'Good') {
        return TextConstants.kRatingTileEnableGoodSubtitle;
      } else if (title == 'Neutral'){
        return TextConstants.kRatingTileEnableNeutralSubtitle;
      }else{
        return TextConstants.kRatingTileEnableBadSubtitle;
      }
    } else {
      if (title == 'Awesome') {
        return TextConstants.kRatingTileDisableAwesomeSubtitle;
      } else if (title == 'Good') {
        return TextConstants.kRatingTileDisableGoodSubtitle;
      } else if (title == 'Neutral') {
        return TextConstants.kRatingTileDisableNeutralSubtitle;
      } else {
        return TextConstants.kRatingTileDisableBadSubtitle;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<InterviewsBloc>(context)
            .add(RatingsScreenSelectEvent(index: index));
      },
      child: BlocBuilder<InterviewsBloc, InterviewsState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreen, width: 2),
              color: isSelected
                  ? ColorConstants.kSelectedContainerColor
                  : ColorConstants.kGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                emoji,
                getTitle(isSelected),
                getSubtitle(isSelected),
              ],
            ),
          );
        },
      ),
    );
  }
}
