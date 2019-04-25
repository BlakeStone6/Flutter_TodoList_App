import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoItem extends StatelessWidget {

  final TodoModel model;

  final Function onCompletionUpdate;
  final Function onDelete;

  const TodoItem({Key key, @required this.model, @required this.onCompletionUpdate, @required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!model.completed) {
      return ListTile(
        leading: Checkbox(
          value: model.completed,
          onChanged: (bool value) {
            onCompletionUpdate(model.id, value);
          },
          activeColor: Colors.black,
        ),
        title: _buildTextContent(),
      );
    }

    return ListTile(
      leading: Checkbox(
        value: model.completed,
        onChanged: (bool value) {
          onCompletionUpdate(model.id, value);
        }
      ),
      title: _buildTextContent(),
      trailing: GestureDetector(
        onTap: () {
          onDelete(model.id);
        },
        child: Icon(Icons.delete, color: Colors.red[700])
      ),
    );
  }





  Text _buildTextContent() {
    return Text(
      model.content,
      style: TextStyle(
        decoration: model.completed ? TextDecoration.lineThrough : TextDecoration.none
      )
    );
  }
}
