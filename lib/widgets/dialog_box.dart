import 'package:flutter/material.dart';
import 'package:todo_app/widgets/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? descController;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  const DialogBox({
    super.key,
    this.onSave,
    this.onCancel,
    this.titleController,
    this.descController,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      contentPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: height * .6,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Task',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: titleController!,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: descController!,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  title: 'Submit',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 15,
                ),
                Button(
                  title: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
