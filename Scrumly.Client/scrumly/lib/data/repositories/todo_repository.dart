import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<List<Todo>> getTodos() => localDataSource.getTodos();

  @override
  Future<void> addTodo(Todo todo) async {
    return localDataSource.addTodo(todo as dynamic); // Casting for simplicity
  }
}