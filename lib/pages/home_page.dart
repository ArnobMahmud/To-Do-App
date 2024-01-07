import 'package:flutter/material.dart';
import '../widgets/dialog_box.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  List todoList = [
    ['Flutter', 'framework', false],
    ['MERN', '', false],
  ];

  //chheck box
  void checkBoxChanged(bool? value, int? index) {
    setState(
      () {
        todoList[index!][2] = !todoList[index][2];
      },
    );
  }

  //create task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (builder) {
        return DialogBox(
          titleController: _titleController,
          descController: _descController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // save task
  void saveNewTask() {
    setState(() {
      todoList.add([_titleController.text, _descController.text, false]);
      _titleController.clear();
      _descController.clear();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 208, 131, 222),
        title: const Text('TO DO'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 11, 34, 43),
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          color: Colors.blueGrey,
          size: 35,
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          return TaskTile(
            taskTitle: todoList[index]?[0],
            taskDes: todoList[index]?[1],
            taskCompleted: todoList[index]?[2],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
