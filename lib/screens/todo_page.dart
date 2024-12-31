import 'package:flutter/material.dart';
import 'package:todolist_app/helpers/database_helper.dart';
import 'package:todolist_app/models/todo.dart';
import 'package:todolist_app/widgets/todo_form.dart';
import 'package:todolist_app/widgets/todo_list_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _searchCtrl = TextEditingController();
  final dbHelper = DatabaseHelper();
  List<Todo> todoList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future<void> refreshList() async {
    setState(() => _isLoading = true);
    final todos = await dbHelper.getAllTodos();
    setState(() {
      todoList = todos;
      _isLoading = false;
    });
  }

  Future<void> cariTodo() async {
    setState(() => _isLoading = true);
    String teks = _searchCtrl.text.trim();
    List<Todo> todos = teks.isEmpty 
        ? await dbHelper.getAllTodos()
        : await dbHelper.searchTodo(teks);
    
    setState(() {
      todoList = todos;
      _isLoading = false;
    });
  }

  Future<void> handleDelete(Todo todo) async {
    await dbHelper.deleteTodo(todo.id!);
    refreshList();

    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todo dihapus'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () async {
            await dbHelper.addTodo(Todo(
              todo.nama,
              todo.deskripsi,
              done: todo.done,
            ));
            refreshList();
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        controller: _searchCtrl,
        onChanged: (_) => cariTodo(),
        decoration: InputDecoration(
          hintText: 'Cari todo...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.info, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Geser ke kiri untuk menghapus todo.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (todoList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Belum ada todo',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return TodoListItem(
          todo: todoList[index],
          onDelete: handleDelete,
          onToggle: (todo) async {
            todo.done = !todo.done;
            await dbHelper.updateTodo(todo);
            refreshList();
          },
          onEdit: (todo) => showTodoForm(context, todo, refreshList),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showTodoForm(context, null, refreshList),
        icon: const Icon(Icons.add),
        label: const Text("Tambah Todo"),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildInfoText(),
          Expanded(child: _buildTodoList()),
        ],
      ),
    );
  }
}
