import 'package:flutter/material.dart';

import '../model/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todos todos;
  const TodoWidget({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          todos.status == 'completed'
              ? const Icon(Icons.radio_button_checked, color: Colors.green)
              : const Icon(Icons.radio_button_off_outlined, color: Colors.red),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: 260,
            child: Text(
              todos.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
