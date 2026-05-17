import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/goal_bloc.dart';
import '../bloc/goal_state.dart';
import '../widgets/goal_card.dart';
import 'add_edit_goal_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Defining the green color from your app bar to keep styling consistent
    const primaryGreen = Color(0xFF0A8F67);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Daily Goals'),
        backgroundColor:
            primaryGreen, // Ensures the AppBar uses the exact green
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<GoalBloc, GoalState>(
        builder: (context, state) {
          if (state is GoalLoading) {
            return const Center(
              // Changed from Maroon (0xFF800020) to your main Green color
              child: CircularProgressIndicator(color: primaryGreen),
            );
          } else if (state is GoalLoaded) {
            if (state.goals.isEmpty) {
              return const Center(
                child: Text(
                  'No goals yet. Tap + to add one!',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ), // Adjusted margins for a cleaner fit
              itemCount: state.goals.length,
              itemBuilder: (context, index) {
                final goal = state.goals[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ), // Clean spacing between the goal boxes
                  child: GoalCard(
                    goal: goal,
                    onEdit: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddEditGoalScreen(goal: goal),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is GoalError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryGreen, // Changes the FAB background to green
        foregroundColor: Colors.white, // Changes the '+' icon to white
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEditGoalScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
