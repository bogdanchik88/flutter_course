import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late Database database;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> tasks = [];

  Future<void> initDb() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)',
        );
      },
      version: 1,
    );

    loadTasks();
  }

  Future<void> addTask(String title) async {
    await database.insert('tasks', {'title': title});
    loadTasks();
  }

  Future<void> loadTasks() async {
    final data = await database.query('tasks');
    setState(() {
      tasks = data;
    });
  }

  Future<void> deleteTask(int id) async {
    await database.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo (SQLite)")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Новая задача",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    addTask(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task['title']),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteTask(task['id']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
