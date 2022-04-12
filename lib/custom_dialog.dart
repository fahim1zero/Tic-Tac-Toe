// ignore_for_file: use_key_in_widget_constructors,
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'main.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  const CustomDialog(this.title, this.content, this.callback, [this.actionText = "Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: darkMode == true ? Colors.white : Colors.black,
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          color: darkMode == true ? Colors.grey : Colors.black,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: callback,
          child: Text(actionText),
        ),
      ],
      backgroundColor: darkMode ? Colors.black54 : Colors.white,
    );
  }
}
