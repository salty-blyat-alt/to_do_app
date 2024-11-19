import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupAdd extends StatelessWidget {
  const PopupAdd({Key? key, required this.tasks, required this.addTask})
      : super(key: key);
      
  final List<String> tasks;
  final void Function(String) addTask;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).push(_modalBuilder(context, null, addTask));
      },
      padding: EdgeInsets.zero,
      child: const Icon(CupertinoIcons.add, color: Colors.white),
    );
  }
}

@pragma('vm:entry-point')
Route<void> _modalBuilder(
    BuildContext context, Object? arguments, void Function(String) addTask) {
  final TextEditingController textController = TextEditingController();

  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Add task'),
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
            child: const Text('Add'),
            onPressed: () {
              final newTask = textController.text;
              addTask(newTask); 
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
