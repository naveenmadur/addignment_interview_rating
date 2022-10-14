import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/bloc/interviews_bloc.dart';

import '../interviewers_page/interviewers_page.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Thank You!',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We have taken your feedback. We are glad that you felt that your interviewer was Awesome',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Text('HOME')),
        onPressed: () {
          BlocProvider.of<InterviewsBloc>(context).add(ResetEvent());
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  const InterviewersPage(title: 'Interviewers'),
            ),
          );
        },
      ),
    );
  }
}
