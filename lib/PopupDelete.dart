import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class PopupDelete extends StatefulWidget {
  const PopupDelete({Key? key, required this.id, required this.deleteTask})
      : super(key: key);

  final int id;
  final void Function(int) deleteTask;

  @override
  _PopupDeleteState createState() => _PopupDeleteState();
}

class _PopupDeleteState extends State<PopupDelete> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).push(_modalBuilder(context, null, widget.id, widget.deleteTask));
      },
      padding: EdgeInsets.zero,
      child: const Icon(CupertinoIcons.delete ),
    );
  }
}

@pragma('vm:entry-point')
Route<void> _modalBuilder(BuildContext context, Object? arguments, int id, void Function(int) deleteTask) {

  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Are you sure you want to delete this?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Delete'),
            onPressed: () {
              deleteTask(id);
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
