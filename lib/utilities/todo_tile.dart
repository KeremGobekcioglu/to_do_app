import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool isDone;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile(
      {super.key,
      required this.taskname,
      required this.isDone,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: const Color(0xFFE2C2FF),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              // CHECKBOX
              Checkbox(
                value: isDone,
                onChanged: onChanged,
              ),
              // NAME OF THE TASK
              Expanded(
                child: Text(
                  taskname,
                  style: TextStyle(
                      decoration: isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
