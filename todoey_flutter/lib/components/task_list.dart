import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/components/task_tile.dart';
import 'package:todoey_flutter/data/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.getTasks[index];
            return GestureDetector(
              onLongPress: () {
                Provider.of<TaskData>(context, listen: false).deleteTask
                  (index);
              },
              child: TaskTile(
                onChange: (checkboxState) {
                  taskData.updateTask(index);
                },
                itemText: task.name,
                isDone: task.isDone,
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
