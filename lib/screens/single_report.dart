import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/models/single_report_screen_arguments.dart';
import 'package:csapp/widgets/fetch_failed.dart';
import 'package:csapp/widgets/report_details.dart';
import 'package:flutter/material.dart';

class SingleReportScreen extends StatelessWidget {
  const SingleReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as SingleReportScreenArguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text("チケット詳細"),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("reports")
              .doc(arguments.ticketId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return ReportDetailsWidget(
                  reportId: snapshot.data!.id,
                  reportJson: snapshot.data!.data());
            }

            return const FetchFailedWidget(
              text: "表示できるデータがありません",
            );
          },
        ));
  }
}
