import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/interviewer_list/data/datasources/interview_list_remote_data_sources.dart';
import 'features/interviewer_list/data/repositories/interview_list_repo_impl.dart';
import 'features/interviewer_list/domain/repositories/interview_list_repository.dart';
import 'features/interviewer_list/domain/use_cases/get_interview_list.dart';
import 'features/interviewer_list/presentation/bloc/interviews_bloc.dart';

final sl = GetIt.instance;

void init() async{
  //! Features - Interview List
  //* Bloc
  sl.registerFactory(() => InterviewsBloc(getInterviewListUseCase: sl()));

  //* Use Case
  sl.registerLazySingleton(() => GetInterviewListUseCase(sl()));

  //* Repository
  sl.registerLazySingleton<InterviewListRepository>(() => InterviewListRepoImpl(
        remoteDataSource: sl(),
      ));

  //* DataSources
  sl.registerLazySingleton<InterviewListRemoteDataSource>(
      () => InteriviewListRemoteDataSourceImpl(client: sl()));

  //! Core -

  //! External
  sl.registerLazySingleton(() => http.Client());
}
