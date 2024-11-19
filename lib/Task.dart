import 'package:flutter/cupertino.dart';
import 'package:to_do_app/PopupDelete.dart';
import 'package:to_do_app/PopupEdit.dart';

class Task extends StatefulWidget {
  const Task(
      {Key? key,
      required this.id,
      required this.taskName,
      required this.deleteTask,
      required this.editTask
      })
      : super(key: key);

  final String taskName;
  final int id;
  final void Function(int) deleteTask;
  final void Function(int, String) editTask;

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(widget.taskName),
      leading: CupertinoCheckbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value ?? false;
          });
        },
      ),
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PopupEdit(id: widget.id, taskName: widget.taskName, editTask: widget.editTask),
          PopupDelete(id: widget.id, deleteTask: widget.deleteTask)
        ],
      ),
    );
  }
}
