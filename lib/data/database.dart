import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  final box = Hive.box('todo');
  List todoList = [];
  void forfirsttime() {
    todoList = [
      ["Welcome to TO DO", false],
      ["Click on the + button to add a new task", false],
      ["Swipe left to delete a task", false],
      ["Click on the checkbox to mark a task as done", false]
    ];
  }

  void get_Data() {
    todoList = box.get('todo');
  }

  void update_Data() {
    box.put('todo', todoList);
  }
}
