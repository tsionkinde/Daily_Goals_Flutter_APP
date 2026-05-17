import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../posts/data/models/goal_model.dart';
import '../bloc/goal_bloc.dart';
import '../bloc/goal_event.dart';

class AddEditGoalScreen extends StatefulWidget {
  final GoalModel? goal;
  const AddEditGoalScreen({super.key, this.goal});

  @override
  State<AddEditGoalScreen> createState() => _AddEditGoalScreenState();
}

class _AddEditGoalScreenState extends State<AddEditGoalScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.goal != null) {
      titleController.text = widget.goal!.title;
      bodyController.text = widget.goal!.body;
    }
  }

  void _save() {
    if (titleController.text.isEmpty) return;

    final goal = GoalModel(
      id: widget.goal?.id ?? DateTime.now().millisecondsSinceEpoch,
      title: titleController.text,
      body: bodyController.text,
    );

    if (widget.goal == null) {
      context.read<GoalBloc>().add(AddGoal(goal));
    } else {
      context.read<GoalBloc>().add(UpdateGoal(goal));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.goal == null ? 'New Goal' : 'Edit Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: bodyController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            ElevatedButton(onPressed: _save, child: const Text('Save Goal')),
          ],
        ),
      ),
    );
  }
}
