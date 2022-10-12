import 'dart:convert';
import '../../../../core/constants/urls.dart';
import '../../../../core/errors/exception.dart';
import '../models/interview_list_model.dart';
import 'package:http/http.dart' as http;

abstract class InterviewListRemoteDataSource {
  /// Calls the https://randomuser.me/api/?seed=ab&inc=name,cell&results=20 endpoint
  /// Throws a [ServerException] for all error codes.
  Future<List<InterviewListModel>> getInterviewList();
}

class InteriviewListRemoteDataSourceImpl implements InterviewListRemoteDataSource {
  final http.Client client;

  InteriviewListRemoteDataSourceImpl({required this.client});
  @override
  Future<List<InterviewListModel>> getInterviewList() async {
    final response = await client.get(Uri.parse(Url.baseUrl));
    List<InterviewListModel> interviewersList = [];
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'];
      for (int i = 0; i < data.length; i++) {
        interviewersList.add(InterviewListModel.fromJson(data[i]));
      }
      return interviewersList;
    } else {
      throw ServerException();
    }
  }
}