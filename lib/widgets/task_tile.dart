import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  final String? taskTitle;
  final String? taskDes;
  final bool? taskCompleted;
  final Function(BuildContext)? deleteTask;
  final Function(bool?)? onChanged;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.taskCompleted,
    this.onChanged,
    this.taskDes,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: deleteTask,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(190, 255, 199, 59),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  value: taskCompleted!,
                  onChanged: onChanged!,
                  mouseCursor: MouseCursor.defer,
                  tristate: true,
                  activeColor: const Color.fromARGB(216, 255, 64, 128),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          taskTitle!,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 9, 7, 49),
                            decorationColor:
                                const Color.fromARGB(255, 46, 11, 43),
                            decoration: taskCompleted!
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          taskDes!,
                          style: GoogleFonts.alata(
                            fontSize: 20,
                            decorationColor:
                                const Color.fromARGB(182, 49, 7, 45),
                            height: 2,
                            decoration: taskCompleted!
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
