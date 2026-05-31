class TodoItem {
  final String id;
  String title;
  String description;
  bool isCompleted;
  final DateTime createdAt;

  TodoItem({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
    required this.createdAt,
  });

  TodoItem copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TodoItem(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt,
    );
  }
}
