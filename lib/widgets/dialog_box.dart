import 'package:flutter/material.dart';
import 'package:todo_app/widgets/button.dart';
import 'package:todo_app/widgets/custom_textfiled.dart';

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
        height: height * .5,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Task',
              style: TextStyle(
                fontSize: 24,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hintText: 'Title',
              controller: titleController!,
              maxLines: 1,
              minLines: 1,
              //expands: false,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hintText: 'Description',
              controller: descController!,
              maxLines: 3,
              minLines: 1,
            ),
            const Spacer(),
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
