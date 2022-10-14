import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/comment_screen/comment_screen.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/thank_you_page/thank_you_page.dart';

import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../bloc/interviews_bloc.dart';

class QualitiesScreenSubmitButton extends StatelessWidget {
  const QualitiesScreenSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CommentScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.mode_comment_outlined,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ADD COMMENT',
                    style: TextStyles.kTrailingTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<InterviewsBloc>(context)
                  .add(NavigateToSubmitScreenEvent());
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ThankYouPage()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3.1,
              decoration: Shadow().kEnableButtonBoxDecoration,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'SUBMIT',
                    style: TextStyles.kEnableButtonTextStyle,
                  ),
                  Icon(
                    Icons.check,
                    color: ColorConstants.kEnableTextColor,
                    size: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
