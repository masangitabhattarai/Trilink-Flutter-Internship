import 'package:flutter/foundation.dart';
import '../models/todo_item.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoItem> _todos = [
    TodoItem(
      id: '1',
      title: 'Complete Flutter assignment',
      description: 'Finish all 4 tasks for Trilink internship',
      isCompleted: false,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    TodoItem(
      id: '2',
      title: 'Read Flutter documentation',
      description: 'Study state management approaches',
      isCompleted: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  List<TodoItem> get todos => List.unmodifiable(_todos);

  List<TodoItem> get pendingTodos =>
      _todos.where((t) => !t.isCompleted).toList();

  List<TodoItem> get completedTodos =>
      _todos.where((t) => t.isCompleted).toList();

  int get totalCount => _todos.length;
  int get completedCount => _todos.where((t) => t.isCompleted).length;

  void addTodo(String title, String description) {
    final todo = TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
    );
    _todos.insert(0, todo);
    notifyListeners();
  }

  void updateTodo(String id, String title, String description) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        title: title,
        description: description,
      );
      notifyListeners();
    }
  }

  void toggleComplete(String id) {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        isCompleted: !_todos[index].isCompleted,
      );
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void deleteCompleted() {
    _todos.removeWhere((t) => t.isCompleted);
    notifyListeners();
  }
}
