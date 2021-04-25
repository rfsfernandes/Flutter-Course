import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Function onChange;
  final String itemText;
  final bool isDone;

  TaskTile({this.onChange, this.itemText, this.isDone});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        itemText,
        style: TextStyle(
            color: Colors.black,
            decoration: isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: onChange,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
