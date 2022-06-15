import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter_test_app/bloc/todo_bloc/todo_state.dart';
import 'package:flutter_test_app/model/todos.dart';
import 'package:flutter_test_app/widgets/todo_api_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TodoStateLoaded) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return TodoWidget(
                todos: state.todos[index],
              );
            },
          );
        }
        if (state is TodoStateError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
