import 'package:flutter/material.dart';
import 'package:my_todo_app/pages/another_page.dart';
import 'package:my_todo_app/pages/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => TodoList(),
        '/example': (context) => AnotherPage()
      },
    );
  }
}
