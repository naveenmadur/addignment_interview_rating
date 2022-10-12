// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:interview_app_clean_code/core/errors/exception.dart';
import 'package:interview_app_clean_code/core/errors/failures.dart';
import 'package:interview_app_clean_code/features/interviewer_list/data/datasources/interview_list_remote_data_sources.dart';
import 'package:interview_app_clean_code/features/interviewer_list/domain/entities/interview_list_entity.dart';
import 'package:interview_app_clean_code/features/interviewer_list/domain/repositories/interview_list_repository.dart';

class InterviewListRepoImpl implements InterviewListRepository {
  final InterviewListRemoteDataSource remoteDataSource;
  InterviewListRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<InterviewListEntity>>> getInterviewList() async {
    try {
      final result = await remoteDataSource.getInterviewList();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
