import 'dart:ffi';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/usecase.dart';
import '../entities/interview_list_entity.dart';
import '../repositories/interview_list_repository.dart';

//! Use Cases depend on Contract

class GetInterviewListUseCase implements UseCase<List<InterviewListEntity>, Void>{
  final InterviewListRepository repository;
  GetInterviewListUseCase(this.repository);

  @override
  Future<Either<Failure, List<InterviewListEntity>>> call() async {
    return await repository.getInterviewList();
  }
}