// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../posts/data/models/goal_model.dart';
import '../bloc/goal_bloc.dart';
import '../bloc/goal_event.dart';

class GoalCard extends StatelessWidget {
  final GoalModel goal;
  final VoidCallback onEdit;

  const GoalCard({super.key, required this.goal, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    // The matching green color from your app bar theme
    const primaryGreen = Color(0xFF0A8F67);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: primaryGreen.withOpacity(0.1)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: primaryGreen, width: 5)),
        ),
        child: ListTile(
          title: Text(
            goal.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryGreen, // Updated to theme green
            ),
          ),
          subtitle: Text(
            goal.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors
                  .grey[800], // Changed to a clean dark grey for readability
              fontSize: 14,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit_outlined, color: Colors.blueGrey),
                onPressed: onEdit,
              ),
              IconButton(
                icon: const Icon(Icons.delete_sweep, color: Colors.redAccent),
                onPressed: () {
                  if (goal.id != null) {
                    context.read<GoalBloc>().add(DeleteGoal(goal.id!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Goal deleted'),
                        backgroundColor:
                            primaryGreen, // Updated snackbar background to match
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
