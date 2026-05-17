import 'package:equatable/equatable.dart';
// Fixed the double slash and confirmed path against image_8e69e5.jpg
import '../../posts/data/models/goal_model.dart';

abstract class GoalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoalInitial extends GoalState {}

class GoalLoading extends GoalState {}

class GoalLoaded extends GoalState {
  final List<GoalModel> goals;

  GoalLoaded(this.goals);

  @override
  List<Object?> get props => [goals]; // Props belongs to the specific class
}

class GoalError extends GoalState {
  final String message;

  GoalError(this.message);

  @override
  List<Object?> get props => [message]; // Props belongs to the specific class
}
