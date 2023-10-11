import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/provider/task_provider.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.fetchTasks().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final task = taskProvider.task;
    final todos = task?.todos ?? [];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Список задач'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final task = todos[index];
                return ListTile(
                  title: Text(task.todo ?? 'Нет названия задачи'),
                  subtitle: Text(
                      task.completed == true ? 'Выполнена' : 'Не выполнена'),
                );
              },
            ),
    );
  }
}
