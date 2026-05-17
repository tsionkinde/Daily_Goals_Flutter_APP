import 'package:equatable/equatable.dart';
import '../../posts/data/models/goal_model.dart';

abstract class GoalEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadGoals extends GoalEvent {}

class AddGoal extends GoalEvent {
  final GoalModel goal;

  AddGoal(this.goal);

  @override
  List<Object?> get props => [goal];
}

class UpdateGoal extends GoalEvent {
  final GoalModel goal;

  UpdateGoal(this.goal);

  @override
  List<Object?> get props => [goal];
}

class DeleteGoal extends GoalEvent {
  final int id;

  DeleteGoal(this.id);

  @override
  List<Object?> get props => [id];
}
