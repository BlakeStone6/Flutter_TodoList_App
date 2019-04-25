import 'package:flutter/material.dart';

import './todo_item.dart';
import './todo_form.dart';

import '../models/todo_model.dart';

/// Displays the list of todo items
class TodoList extends StatefulWidget {
  final List<TodoModel> initialTodos = [];

  TodoList({Key key}) : super(key: key);

  _TodoListState createState() => _TodoListState();
}


class _TodoListState extends State<TodoList> {

  List<TodoModel> _todos;

  @override
  void initState() {
    super.initState();

    _todos = widget.initialTodos;

    _todos.add(
      TodoModel("Add a todo item")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TodoForm(onSubmit: _addItem),
          _buildTodoList(),
        ],
      ),
    );
  }


  /// Method that is called by a child (todo form) to add a new todo item to the list
  void _addItem(String newContent) {
    if (newContent.isNotEmpty) {
      TodoModel newItem = TodoModel(newContent);

      setState(() {
        _todos = List.from(_todos)..insert(0, newItem);
      });

      Scaffold.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 1200),
          content: Text("Added todo to list"),
          action: SnackBarAction(
            label: "Cancel",
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();  // Hide the snackbar
              _deleteItem(newItem.id);  // Delete the newly added item
            },
          ),
        )
      );
    }
  }


  /// Method that is called by a child (todo item) to update its completion status
  void _updateCompletion(int todoId, bool completion) {
    setState(() {
      // Gathering the index of the item to update
      int updateIndex = _todos.indexWhere((item) => item.id == todoId);

      List<TodoModel> updatedTodos = List.from(_todos);

      updatedTodos[updateIndex].completed = completion;

      _todos = updatedTodos;  // Force update
    });
  }


  /// Method that is called by a child (todo item) to ask to be deleted
  void _deleteItem(int todoId) {
    setState(() {
      _todos = List.from(_todos)..removeWhere((item) => item.id == todoId);
    });
  }


  /// Builds the todos list
  ListView _buildTodoList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoItem(
          model: _todos[index],
          onCompletionUpdate: _updateCompletion,
          onDelete: _deleteItem
        );
      },
    );
  }
}
