import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_list/api/task_model.dart';

class TaskProvider with ChangeNotifier {
  Task? _task;

  Task? get task => _task;

  Future<void> fetchTasks() async {
    final dio = Dio();
    final response = await dio.get('https://dummyjson.com/todos/');

    if (response.statusCode == 200) {
      _task = Task.fromJson(response.data);
      notifyListeners();
    }
  }
}
