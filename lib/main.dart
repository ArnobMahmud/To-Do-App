import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //open box
  await Hive.openBox('mybox');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO APP',
      home: HomePage(),
    );
  }
}
