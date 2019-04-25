import 'package:flutter/material.dart';

/// Form to add a new todo item to the list
class TodoForm extends StatelessWidget {

  final Function onSubmit;

  final TextEditingController inputController = TextEditingController();


  TodoForm({Key key, @required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: TextField(
                controller: inputController,
                autocorrect: true,
                autofocus: false,
                maxLength: 120,
                maxLengthEnforced: true,
                decoration: InputDecoration(
                  hintText: "New todo item"
                ),
              ),
            )
          ),

          RaisedButton(
            child: Icon(Icons.add, color: Theme.of(context).accentIconTheme.color),
            onPressed: () {
              onSubmit(inputController.text);
            },
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
          )
        ],
      ),
    );
  }
}
