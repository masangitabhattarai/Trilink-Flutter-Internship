import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showAddEditDialog({TodoItem? item}) {
    final titleController = TextEditingController(text: item?.title ?? '');
    final descController =
    TextEditingController(text: item?.description ?? '');
    final formKey = GlobalKey<FormState>();
    final isEditing = item != null;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          isEditing ? 'Edit Task' : 'Add New Task',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF1A1A2E),
          ),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Title is required' : null,
                decoration: InputDecoration(
                  labelText: 'Task Title *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color(0xFF06D6A0), width: 2),
                  ),
                ),
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: descController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description (optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color(0xFF06D6A0), width: 2),
                  ),
                  alignLabelWithHint: true,
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF6B7280)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final provider =
                context.read<TodoProvider>();
                if (isEditing) {
                  provider.updateTodo(
                    item!.id,
                    titleController.text.trim(),
                    descController.text.trim(),
                  );
                } else {
                  provider.addTodo(
                    titleController.text.trim(),
                    descController.text.trim(),
                  );
                }
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF06D6A0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              isEditing ? 'Save Changes' : 'Add Task',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, TodoItem item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Delete Task',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content:
        Text('Are you sure you want to delete "${item.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel',
                style: TextStyle(color: Color(0xFF6B7280))),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TodoProvider>().deleteTodo(item.id);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Task deleted'),
                  backgroundColor: Colors.red.shade400,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Delete',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'To-Do App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF1A1A2E),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Color(0xFF1A1A2E)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Consumer<TodoProvider>(
            builder: (_, provider, __) {
              if (provider.completedCount == 0) return const SizedBox();
              return IconButton(
                icon: const Icon(Icons.delete_sweep_rounded,
                    color: Colors.red),
                tooltip: 'Delete completed',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text('Clear Completed'),
                      content: Text(
                          'Delete all ${provider.completedCount} completed tasks?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            provider.deleteCompleted();
                            Navigator.pop(ctx);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Clear',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF06D6A0),
          unselectedLabelColor: const Color(0xFF9CA3AF),
          indicatorColor: const Color(0xFF06D6A0),
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Progress bar
          Consumer<TodoProvider>(
            builder: (_, provider, __) {
              final total = provider.totalCount;
              final completed = provider.completedCount;
              final progress = total == 0 ? 0.0 : completed / total;

              return Container(
                color: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$completed of $total tasks completed',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF06D6A0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: const Color(0xFFE5E7EB),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF06D6A0)),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _TodoList(
                  getItems: (p) => p.pendingTodos,
                  emptyMessage: 'No pending tasks!\nTap + to add a new task.',
                  onEdit: (item) => _showAddEditDialog(item: item),
                  onDelete: (item) => _confirmDelete(context, item),
                ),
                _TodoList(
                  getItems: (p) => p.completedTodos,
                  emptyMessage: 'No completed tasks yet.',
                  onEdit: (item) => _showAddEditDialog(item: item),
                  onDelete: (item) => _confirmDelete(context, item),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEditDialog(),
        backgroundColor: const Color(0xFF06D6A0),
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text(
          'Add Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        elevation: 4,
      ),
    );
  }
}

class _TodoList extends StatelessWidget {
  final List<TodoItem> Function(TodoProvider) getItems;
  final String emptyMessage;
  final void Function(TodoItem) onEdit;
  final void Function(TodoItem) onDelete;

  const _TodoList({
    required this.getItems,
    required this.emptyMessage,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (_, provider, __) {
        final items = getItems(provider);

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.task_alt_rounded,
                  size: 72,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 16),
                Text(
                  emptyMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _TodoTile(
              item: item,
              onToggle: () => provider.toggleComplete(item.id),
              onEdit: () => onEdit(item),
              onDelete: () => onDelete(item),
            );
          },
        );
      },
    );
  }
}

class _TodoTile extends StatelessWidget {
  final TodoItem item;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _TodoTile({
    required this.item,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: GestureDetector(
          onTap: onToggle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.isCompleted
                  ? const Color(0xFF06D6A0)
                  : Colors.transparent,
              border: Border.all(
                color: item.isCompleted
                    ? const Color(0xFF06D6A0)
                    : const Color(0xFFD1D5DB),
                width: 2,
              ),
            ),
            child: item.isCompleted
                ? const Icon(Icons.check_rounded,
                color: Colors.white, size: 16)
                : null,
          ),
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: item.isCompleted
                ? const Color(0xFF9CA3AF)
                : const Color(0xFF1A1A2E),
            decoration: item.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: item.description.isNotEmpty
            ? Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            item.description,
            style: TextStyle(
              fontSize: 13,
              color: item.isCompleted
                  ? const Color(0xFFD1D5DB)
                  : const Color(0xFF6B7280),
              decoration: item.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined,
                  color: Color(0xFF4361EE), size: 20),
              onPressed: onEdit,
              tooltip: 'Edit',
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded,
                  color: Colors.red, size: 20),
              onPressed: onDelete,
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
