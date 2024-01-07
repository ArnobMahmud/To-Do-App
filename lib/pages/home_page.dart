import 'package:flutter/material.dart';
import '../db/dummy_model.dart';
import '../widgets/dialog_box.dart';
import '../widgets/task_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

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
    if (_titleController.text.isNotEmpty || _descController.text.isNotEmpty) {
      setState(() {
        todoList.add([_titleController.text, _descController.text, false]);
        _titleController.clear();
        _descController.clear();
      });
    } else {
      Navigator.of(context).pop;
    }
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 150, 219),
        title: Text(
          'TO DO',
          style: GoogleFonts.lato(
            fontSize: 40,
            color: const Color.fromARGB(255, 7, 14, 55),
            letterSpacing: 2,
          ),
        ),
        elevation: 7.0,
        centerTitle: true,
      ),
      floatingActionButton: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 9, 7, 49),
          borderRadius: BorderRadius.circular(40),
        ),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: createNewTask,
          child: const Icon(
            Icons.edit,
            size: 35,
            color: Color.fromARGB(255, 140, 186, 223),
          ),
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
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
