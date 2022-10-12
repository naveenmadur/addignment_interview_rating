import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/interviewer_list/presentation/bloc/interviews_bloc.dart';
import 'features/interviewer_list/presentation/home_screen/pages/interviewers_page.dart';
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
        home: const InterviewersPage(title: 'Interviewers'),
      ),
    );
  }
}
