import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/model/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy this')
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get getTasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(int position){
    _tasks[position].toggleDone();
    notifyListeners();
  }

  void deleteTask(int position) {
    _tasks.removeAt(position);
    notifyListeners();
  }

}