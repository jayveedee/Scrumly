import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart';

class TodoViewModel extends AsyncNotifier<List<Todo>> {
  late GetTodos _getTodos;

  List<Todo> todos = [];

  @override
  Future<List<Todo>> build() async {
    _getTodos = ref.watch(getTodosProvider);
    return await _getTodos();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _getTodos();
    });
  }

  void addTodo(Todo todo) {
    final todos = state.value ?? [];

    state = AsyncData([...todos, todo]);
  }
}
