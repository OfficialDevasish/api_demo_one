import 'package:flutter/material.dart';

import '../all_model_class.dart';
import '../api_service/todo_service.dart';

class TodoProvider extends ChangeNotifier {

  final _service = TodoService();

  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}