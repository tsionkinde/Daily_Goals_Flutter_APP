import 'package:dio/dio.dart';
import '../../../../../core/constants/api_constants.dart';
import '../models/goal_model.dart';

class GoalService {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<List<GoalModel>> getGoals() async {
    try {
      final response = await dio.get(ApiConstants.goalsEndpoint);

      List data = response.data;

      return data.map((e) => GoalModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch goals');
    }
  }

  Future<void> addGoal(GoalModel goal) async {
    try {
      await dio.post(ApiConstants.goalsEndpoint, data: goal.toJson());
    } catch (e) {
      throw Exception('Failed to add goal');
    }
  }

  Future<void> updateGoal(GoalModel goal) async {
    try {
      await dio.put(
        '${ApiConstants.goalsEndpoint}/${goal.id}',
        data: goal.toJson(),
      );
    } catch (e) {
      throw Exception('Failed to update goal');
    }
  }

  Future<void> deleteGoal(int id) async {
    try {
      await dio.delete('${ApiConstants.goalsEndpoint}/$id');
    } catch (e) {
      throw Exception('Failed to delete goal');
    }
  }
}
