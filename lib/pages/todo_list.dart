import 'package:flutter/material.dart';
import 'package:my_todo_app/shared/my_drawer.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final items = <TodoItem>[
    TodoItem('Put away groceries'),
    TodoItem('Walk the dog'),
    TodoItem('Pick up mail')
  ];

  completeItem(TodoItem item, bool checked) {
    setState(() {
      item.done = checked;
    });
  }

  removeItem(TodoItem item) {
    setState(() {
      items.remove(item);
    });
  }

  addItem(String name) {
    setState(() {
      items.add(TodoItem(name));
    });
  }

  showAddItemDialog(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    String newItemName;
    var result = await showDialog(
      context: context,
      builder: (BuildContext c) {
        return AlertDialog(
          title: Text('New Todo Item'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Item Name'),
              validator: (value) {
                if (value.isEmpty) return 'Item name is required';
              },
              onSaved: (newName) {
                newItemName = newName;
              },
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            RaisedButton(
              child: Text('Add'),
              textColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.of(context).pop(true);
                }
              },
            )
          ],
        );
      },
    );
    if (result == true) addItem(newItemName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[Text('My Todo App'), Icon(Icons.check)],
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showAddItemDialog(context),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          for (var item in items) ...[
            buildItemRow(
                item: item, onComplete: completeItem, onDelete: removeItem),
            Divider(),
          ],
        ],
      ),
    );
  }

  Widget buildItemRow({TodoItem item, Function onComplete, Function onDelete}) {
    return ListTile(
      leading: Checkbox(
        value: item.done,
        onChanged: (checked) => onComplete(item, checked),
      ),
      title: Text(
        item.name,
        textScaleFactor: 1.2,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => onDelete(item),
      ),
      onTap: () => onComplete(item, !item.done),
    );
  }
}

class TodoItem {
  String name;
  bool done;

  TodoItem(this.name, {this.done = false});
}
