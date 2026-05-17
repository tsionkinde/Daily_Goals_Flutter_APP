import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dailt_goals/features/posts/data/repositories/goal_repository.dart';
import 'goal_event.dart';
import 'goal_state.dart';

class GoalBloc extends Bloc<GoalEvent, GoalState> {
  final GoalRepository repository;

  GoalBloc(this.repository) : super(GoalInitial()) {
    on<LoadGoals>(_onLoadGoals);
    on<AddGoal>(_onAddGoal);
    on<UpdateGoal>(_onUpdateGoal);
    on<DeleteGoal>(_onDeleteGoal);
  }

  Future<void> _onLoadGoals(LoadGoals event, Emitter<GoalState> emit) async {
    emit(GoalLoading());
    try {
      final goals = await repository.getGoals();
      emit(GoalLoaded(goals));
    } catch (e) {
      emit(GoalError(e.toString()));
    }
  }

  Future<void> _onAddGoal(AddGoal event, Emitter<GoalState> emit) async {
    try {
      await repository.addGoal(event.goal);
      final goals = await repository.getGoals();
      emit(GoalLoaded(goals)); // Emit fresh state directly
    } catch (e) {
      emit(GoalError(e.toString()));
    }
  }

  Future<void> _onUpdateGoal(UpdateGoal event, Emitter<GoalState> emit) async {
    try {
      await repository.updateGoal(event.goal);
      final goals = await repository.getGoals();
      emit(GoalLoaded(goals)); // Emit fresh state directly
    } catch (e) {
      emit(GoalError(e.toString()));
    }
  }

  Future<void> _onDeleteGoal(DeleteGoal event, Emitter<GoalState> emit) async {
    try {
      await repository.deleteGoal(event.id);
      final goals = await repository.getGoals();
      emit(GoalLoaded(goals)); // Emit fresh state directly
    } catch (e) {
      emit(GoalError(e.toString()));
    }
  }
}
