import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter_test_app/bloc/todo_bloc/todo_event.dart';
import 'package:flutter_test_app/repository/todo_repository.dart';
import 'package:flutter_test_app/screens/main_screen.dart';
import 'package:flutter_test_app/services/api/todos_api_service.dart';
import 'package:http/http.dart' as http;

void main() {
  final todosRepository =
      TodoRepository(todosService: TodosService(httpClient: http.Client()));
  runApp(MyApp(
    todoRepository: todosRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.todoRepository}) : super(key: key);

  final TodoRepository todoRepository;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TodoBloc(todoRepository: todoRepository)..add(TodoEventFetch()),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
