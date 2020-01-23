import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListBox extends StatefulWidget {
  @override
  _ListBoxState createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  Map<String, bool> todos = new Map();

  createDialog(BuildContext context) {
    TextEditingController todoController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Todo List"),
            content: TextField(
              autofocus: true,
              controller: todoController,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(todoController.text.toString());
                },
                child: Text("Cancel", style: TextStyle(color: Colors.blue)),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop(todoController.text.toString());
                },
                child: Text("Add", style: TextStyle(color: Colors.blue)),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView(
        children: todos.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: todos[key],
            onChanged: (bool value) {
              setState(() {
                todos[key] = value;
              });
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
