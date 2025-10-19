import '../entities/todo.dart';
import '../../core/errors.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
}