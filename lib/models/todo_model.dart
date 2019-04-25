/// Represents a todo item (and all its necessary data)
class TodoModel {
  /// Text content of a todo item
  final String content;

  /// Whether or not the todo item is completed 
  bool completed = false;

  /// Unique identifier of the todo item
  int id;

  /// Counts and holds the total number of todos created
  static int _todosCount = 0;

  /// Creates a todo item with its content only
  TodoModel(this.content) {
    id = ++_todosCount;
  }

  /// Creates a todo item with its content only
  TodoModel.fromContent({this.content}) {
    id = ++_todosCount;
  }

  /// Creates a todo item with its content and its completion state
  TodoModel.withCompletion({this.content, this.completed}) {
    id = ++_todosCount;
  }
}
