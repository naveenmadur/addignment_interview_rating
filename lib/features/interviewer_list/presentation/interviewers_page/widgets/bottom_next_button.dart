import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/core/constants/text_styles.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/ratings_screen/ratings_screen.dart';
import '../../../../../core/constants/color_constants.dart';

import '../../bloc/interviews_bloc.dart';

class BottomNextButton extends StatelessWidget {
  const BottomNextButton({
    Key? key,
  }) : super(key: key);

  Decoration _getDecoration(state) {
    if (state.buttonActiveStatus) {
      return Shadow().kDisableButtonBoxDecoration;
    } else {
      return Shadow().kEnableButtonBoxDecoration;
    }
  }

  TextStyle _getTextStyle(state) {
    if (state.buttonActiveStatus) {
      return TextStyles.kDisableButtonTextStyle;
    } else {
      return TextStyles.kEnableButtonTextStyle;
    }
  }

  Color _getIconColor(state) {
    if (state.buttonActiveStatus) {
      return ColorConstants.kDisableTextColor;
    } else {
      return ColorConstants.kEnableTextColor;
    }
  }

  GestureDetector nextButton(BuildContext context, LoadedState state) {
    return GestureDetector(
      onTap: () {
        if (!state.buttonActiveStatus) {
          BlocProvider.of<InterviewsBloc>(context)
              .add(NavigateToRatingsScreenEvent());
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const RatingsScreen()));
        } else {
          null;
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.2,
        decoration: _getDecoration(state),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Next',
              style: _getTextStyle(state),
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: _getIconColor(state),
              size: 30,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterviewsBloc, InterviewsState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return nextButton(context, state);
        } else {
          return const Text('');
        }
      },
    );
  }
}
