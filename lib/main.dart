import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/comment_screen/comment_screen.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/thank_you_page/thank_you_page.dart';
import 'features/interviewer_list/presentation/bloc/interviews_bloc.dart';
import 'features/interviewer_list/presentation/interviewers_page/interviewers_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<InterviewsBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const CommentScreen(),
        home: const InterviewersPage(),
        // home: const RatingsScreen(),
        // home: const SubmitScreen(),
        // home: const ThankYouPage(),
      ),
    );
  }
}
