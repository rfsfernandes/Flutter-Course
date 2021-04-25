import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/data/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  AddTaskScreen();

  @override
  Widget build(BuildContext context) {
    String userInput;

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: textEditingController,
                onChanged: (value) {
                  userInput = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Write your note...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (userInput != null && userInput.isNotEmpty) {
                    Provider.of<TaskData>(context, listen: false).addTask(userInput);
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.lightBlueAccent,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
