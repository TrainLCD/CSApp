import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'open_update_error_dialog.dart';

Future<void> resolveReport(
    BuildContext context, String reportId, String reason) async {
  await FirebaseFirestore.instance.collection("reports").doc(reportId).update({
    "resolved": true,
    "resolvedReason": reason,
    "resolverUid": FirebaseAuth.instance.currentUser?.uid,
    "updatedAt": Timestamp.now(),
    "resolvedAt": Timestamp.now(),
  }).catchError((e) {
    openUpdateErrorDialog(context);
  });
}
