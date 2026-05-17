import '../models/goal_model.dart';
import '../services/goal_service.dart';

class GoalRepository {
  final GoalService service;
  final List<GoalModel> _cache = [];

  GoalRepository(this.service);

  Future<List<GoalModel>> getGoals() async {
    // Crucial: Return a NEW list instance so Bloc/Equatable detect changes
    return List<GoalModel>.from(_cache);
  }

  Future<void> addGoal(GoalModel goal) async {
    _cache.add(goal);
  }

  Future<void> updateGoal(GoalModel goal) async {
    final index = _cache.indexWhere((g) => g.id == goal.id);
    if (index != -1) {
      _cache[index] = goal;
    }
  }

  Future<void> deleteGoal(int id) async {
    // Reassigning to a new list filtered by ID
    _cache.removeWhere((goal) => goal.id == id);
  }
}
