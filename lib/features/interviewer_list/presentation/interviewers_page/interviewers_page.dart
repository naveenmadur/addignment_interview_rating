import 'package:flutter/material.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/interviewers_page/widgets/interviewers_page_body.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/text_styles.dart';
import 'widgets/bottom_next_button.dart';
import 'widgets/interviewers_page_body.dart';

class InterviewersPage extends StatelessWidget {
  const InterviewersPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Interviewers',
          style: TextStyles.kAppBarTextStyle,
        ),
        elevation: 0,
        backgroundColor: ColorConstants.kGrey,
        centerTitle: false,
      ),
      body:  const InterviewersPageBody(),
      floatingActionButton: const BottomNextButton(),
    );
  }
}
