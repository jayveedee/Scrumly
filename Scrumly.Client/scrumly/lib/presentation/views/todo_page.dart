import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../di/providers.dart';
import '../../domain/entities/todo.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todoViewModelProvider);
    final todoVM = ref.read(todoViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: todosAsync.when(
        data: (todos) => ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, i) {
            final todo = todos[i];
            return ListTile(
              title: Text(todo.title),
              trailing: Icon(
                todo.completed ? Icons.check : Icons.circle_outlined,
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final todos = todosAsync.value ?? [];
          final newTodo = Todo(
            id: todos.length + 1,
            title: todos.isEmpty ? 'First Todo' : 'New Todo',
          );
          todoVM.addTodo(newTodo);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
