import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'open_update_error_dialog.dart';

Future<void> reopenReport(BuildContext context, String reportId) async {
  await FirebaseFirestore.instance.collection("reports").doc(reportId).update({
    "resolved": false,
    "resolverUid": FirebaseAuth.instance.currentUser?.uid,
    "updatedAt": Timestamp.now(),
    "resolvedAt": null,
  }).catchError((e) {
    openUpdateErrorDialog(context);
  });
}
