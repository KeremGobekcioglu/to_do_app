import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:to_do/data/database.dart";
import "package:to_do/utilities/todo_tile.dart";
import "package:to_do/utilities/dialog_box.dart";
import 'package:hive/hive.dart'; // Import the hive package.

class HomePage extends StatefulWidget {
  final _controller = TextEditingController();
  late Box box;
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDatabase database = ToDoDatabase();

  @override
  void initState() {
    widget.box = Hive.box('todo');
    if (widget.box.isEmpty) {
      database.forfirsttime();
      database.update_Data();
    } else {
      database.get_Data();
    }
    super.initState();
  }

  void newTask() {
    setState(() {
      database.todoList.add([widget._controller.text, false]);
      widget._controller.clear();
    });
    Navigator.of(context).pop();
    database.update_Data();
  }

  // checkbox control
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            controller: widget._controller,
            onAdded: newTask,
            onCanceled: () => Navigator.of(context).pop());
      },
    );
  }

  void delete(int index) {
    setState(() {
      database.todoList.removeAt(index);
    });
    database.update_Data();
  }

  void checkboxchange(bool? value, int index) {
    setState(() {
      database.todoList[index][1] = !database.todoList[index][1];
    });
    database.update_Data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2B1B1),
        appBar: AppBar(
            title: const Text("TO DO"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color(0xFF9FAF90)),
        floatingActionButton: FloatingActionButton(
          onPressed: addTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: database.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskname: database.todoList[index][0],
                isDone: database.todoList[index][1],
                onChanged: (bool? value) => checkboxchange(value, index),
                deleteTask: (context) => delete(index));
          },
        ));
  }
}
