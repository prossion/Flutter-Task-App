import 'package:flutter/material.dart';

class TaskAddWidget extends StatefulWidget {
  const TaskAddWidget({Key? key}) : super(key: key);

  @override
  State<TaskAddWidget> createState() => _TaskAddWidgetState();
}

class _TaskAddWidgetState extends State<TaskAddWidget> {
  var _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Title',
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 2) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Done!'))
            ],
          ),
        ),
      ),
    );
  }
}
