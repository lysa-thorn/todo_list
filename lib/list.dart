import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListBox extends StatefulWidget {
  @override
  _ListBoxState createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  //create object map that has key is String and value is boolean
  Map<String, bool> todos = new Map();
  /**
   *@param text is a String 
   * return text with checkbox
   */
  void add(String text) {
    setState(() {
      if (text != "") {
        //add text into todos
        todos[text] = false;
      }
    });
  }
  /**
   * @param context is BuildContext for display on screen
   * return 
   */
  createDialog(BuildContext context) {
    //Creates a controller for an editable text field.
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
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel", style: TextStyle(color: Colors.blue)),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  add(todoController.text.toString());
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
