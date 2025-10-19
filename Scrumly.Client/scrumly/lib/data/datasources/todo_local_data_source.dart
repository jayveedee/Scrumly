import '../models/todo.dart';

class TodoLocalDataSource {
  final List<TodoModel> _todos = [];

  Future<List<TodoModel>> getTodos() async => _todos;

  Future<void> addTodo(TodoModel todo) async => _todos.add(todo);
}