import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String? taskTitle;
  final String? taskDes;
  final bool? taskCompleted;
  final Function(bool?)? onChanged;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.taskCompleted,
    this.onChanged,
    this.taskDes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 199, 59),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Checkbox(value: taskCompleted!, onChanged: onChanged!),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskTitle!,
                style: TextStyle(
                  fontSize: 20,
                  decoration: taskCompleted!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Text(
                taskDes!,
                style: TextStyle(
                  fontSize: 16,
                  decoration: taskCompleted!
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
