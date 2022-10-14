import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/qualities_screen/qualities_screen.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../bloc/interviews_bloc.dart';
import '../../../../../core/constants/color_constants.dart';

class RatingsScreenNextButton extends StatelessWidget {
  const RatingsScreenNextButton(
      {Key? key,})
      : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<InterviewsBloc>(context).add(FetchInterviewerListEvent());
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'GO BACK',
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QualitiesScreen()));
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
