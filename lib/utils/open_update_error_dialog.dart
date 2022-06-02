import 'package:flutter/material.dart';

import '../enums/error_dialog_answers.dart';

void openUpdateErrorDialog(BuildContext context) {
  showDialog<ErrorDialogAnswers>(
      context: context,
      builder: (BuildContext context) =>
          SimpleDialog(title: const Text("更新に失敗しました"), children: <Widget>[
            SimpleDialogOption(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context, ErrorDialogAnswers.ok);
              },
            )
          ])).then((value) {
    switch (value) {
      case ErrorDialogAnswers.ok:
        break;
      case null:
        break;
    }
  });
}
