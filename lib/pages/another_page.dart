import 'package:flutter/material.dart';
import 'package:my_todo_app/shared/my_drawer.dart';

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Card(
          child: Center(
            child: Text('Something else could go here...'),
          ),
          elevation: 3.0,
        ),
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(16.0),
      ),
    );
  }
}
