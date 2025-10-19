import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/datasources/todo_local_data_source.dart';
import '../data/repositories/todo_repository.dart';
import '../domain/usecases/get_todos.dart';
import '../domain/entities/todo.dart';
import '../presentation/viewmodels/todo_viewmodel.dart';

final todoLocalDataSourceProvider = Provider((_) => TodoLocalDataSource());

final todoRepositoryProvider = Provider(
  (ref) => TodoRepositoryImpl(ref.watch(todoLocalDataSourceProvider)),
);

final getTodosProvider = Provider(
  (ref) => GetTodos(ref.watch(todoRepositoryProvider)),
);

final todoViewModelProvider = AsyncNotifierProvider<TodoViewModel, List<Todo>>(
  TodoViewModel.new,
);
