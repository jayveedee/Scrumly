import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({required int id, required String title, bool completed = false})
      : super(id: id, title: title, completed: completed);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}