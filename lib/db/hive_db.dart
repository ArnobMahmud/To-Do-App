import 'package:hive_flutter/hive_flutter.dart';

class ToDoDB {
  List todoList = [];
  final myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ['Flutter', 'Framework', false],
      ['MERN', 'Tech stack', false],
    ];
  }

  void loadData() {
    todoList = myBox.get('TODOLIST');
  }

  void updateData() {
    myBox.put("TODOLIST", todoList);
  }
}
