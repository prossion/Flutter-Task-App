import 'package:flutter_test_app/model/todos.dart';
import 'package:flutter_test_app/services/api/todos_api_service.dart';

class TodoRepository {
  TodosService todosService;
  TodoRepository({required this.todosService});

  Future<List<Todos>> getTodos() => todosService.getTodos();
}
