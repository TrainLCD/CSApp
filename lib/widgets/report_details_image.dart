import 'package:csapp/widgets/fetch_failed.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ReportDetailsImage extends StatelessWidget {
  const ReportDetailsImage({super.key, required this.reportId});

  final String reportId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseStorage.instance
            .ref()
            .child("reports/$reportId.png")
            .getDownloadURL(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 1)
              ]),
              child: Image.network(snapshot.data!.toString()),
            );
          }

          return const FetchFailedWidget(
            text: "画像を表示できません",
          );
        });
  }
}
