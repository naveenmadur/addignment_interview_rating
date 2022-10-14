import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/thank_you_page/thank_you_page.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../bloc/interviews_bloc.dart';

class CommentScreenSubmitButtin extends StatelessWidget {
  const CommentScreenSubmitButtin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'SKIP',
              style: TextStyles.kTrailingTextStyle,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.2,
            decoration: Shadow().kEnableButtonBoxDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<InterviewsBloc>(context)
                    .add(NavigateToSubmitScreenEvent());
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ThankYouPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'NEXT',
                    style: TextStyles.kEnableButtonTextStyle,
                  ),
                  Icon(
                    Icons.chevron_right_outlined,
                    color: ColorConstants.kEnableTextColor,
                    size: 30,
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