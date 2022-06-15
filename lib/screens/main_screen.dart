import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/home_screen.dart';
import 'package:flutter_test_app/screens/completed_screen.dart';
import 'package:flutter_test_app/screens/favorite_screen.dart';
import 'package:flutter_test_app/screens/task_add_widget.dart';
import 'package:flutter_test_app/screens/uncompleted_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => const TaskAddWidget(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          },
          label: const Text('Add a task'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('Board'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notification_add)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
          bottom: createTabBar(),
        ),
        body: const TabBarView(
          children: [
            MainScreen(),
            CompletedScreen(),
            UnCompletedScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}

TabBar createTabBar() {
  return TabBar(
    tabs: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: const [
          Text("All"),
          SizedBox(
            width: 5,
            height: 5,
          )
        ]),
      ),
      Row(children: const [
        Text("Completed", style: TextStyle()),
        SizedBox(
          width: 5,
          height: 5,
        )
      ]),
      Row(children: const [
        Text("UnCompleted"),
        SizedBox(
          width: 5,
          height: 5,
        )
      ]),
      Row(children: const [
        Text("Favorite"),
        SizedBox(
          width: 5,
          height: 5,
        ),
      ]),
    ],
    isScrollable: true,
  );
}
