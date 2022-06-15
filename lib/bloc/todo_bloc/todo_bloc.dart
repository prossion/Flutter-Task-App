import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/bloc/todo_bloc/todo_event.dart';
import 'package:flutter_test_app/bloc/todo_bloc/todo_state.dart';
import 'package:flutter_test_app/model/todos.dart';
import 'package:flutter_test_app/repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  TodoBloc({required this.todoRepository}) : super(TodoStateInitial()) {
    on<TodoEventFetch>(
      ((event, emit) async {
        emit(TodoStateInitial());
        try {
          final List<Todos> loadedTodosList = await todoRepository.getTodos();
          emit(TodoStateLoaded(todos: loadedTodosList));
        } catch (_) {
          emit(TodoStateError(message: 'Unexpected error!'));
          rethrow;
        }
      }),
    );
  }
}
