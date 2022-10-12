import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/interview_list_entity.dart';

//! Contract
abstract class InterviewListRepository {
  Future<Either<Failure, List<InterviewListEntity>>> getInterviewList();
}
