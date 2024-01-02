import 'package:flutter/material.dart';
import 'package:to_do/utilities/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onAdded;
  VoidCallback onCanceled;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onAdded,
      required this.onCanceled});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF9FAF90),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Add a new task",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(buttonName: "Add", onPressed: onAdded),
                Buttons(buttonName: "Cancel", onPressed: onCanceled)
              ],
            )
          ],
        ),
      ),
    );
  }
}
