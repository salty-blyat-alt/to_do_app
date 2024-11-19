import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class PopupEdit extends StatefulWidget {
  const PopupEdit(
      {Key? key,
      required this.id,
      required this.taskName,
      required this.editTask})
      : super(key: key);

  final int id;
  final String taskName;
  final void Function(int, String) editTask;

  @override
  _PopupEditState createState() => _PopupEditState();
}

class _PopupEditState extends State<PopupEdit> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).push(_modalBuilder(
            context, null, widget.id, widget.taskName, widget.editTask));
      },
      padding: EdgeInsets.zero,
      child: const Icon(CupertinoIcons.pencil),
    );
  }
}

@pragma('vm:entry-point')
Route<void> _modalBuilder(BuildContext context, Object? arguments, int id,
    String taskName, void Function(int, String) editTask) {
  final TextEditingController textController = TextEditingController(text: taskName);

  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Are you sure you want to delete this?'),
        content: CupertinoTextField(
          controller: textController,
          placeholder: 'Enter your task',
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Edit'),
            onPressed: () {
              final newTask = textController.text;
              editTask(id, newTask  );
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
