import 'package:flutter/cupertino.dart';
import 'PopupAdd.dart';
import 'Task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = ['task 1', 'task 1', 'task 1']; // List of tasks

  // Method to add a new task
  void addTask(String task) {
    setState(() {
      tasks.add(task); // Add task to the list
    });
  }

  void deleteTask(int id) {
    setState(() {
      tasks.removeAt(id); // Add task to the list
    });
  }

  void editTask(int id, String newTask) {
    setState(() {
        tasks[id] = newTask;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "To do",
          style: TextStyle(color: CupertinoColors.white),
        ),
        trailing: PopupAdd(
          tasks: tasks,
          addTask: addTask,
        ),
      ),
      child: SafeArea(
        child: CupertinoListSection(
            header: const Text("Tasks"),
            children: tasks.isEmpty
                ? [const CupertinoListTile(title: Text('No task'))]
                : tasks.asMap().entries.map((entry) {
                    int index = entry.key;
                    String task = entry.value;

                    return Task(
                        id: index, // Passing the index as an ID
                        taskName: task,
                        deleteTask: deleteTask, editTask: editTask);
                  }).toList()),
      ),
    );
  }
}
