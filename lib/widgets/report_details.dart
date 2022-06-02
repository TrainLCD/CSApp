import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/models/report.dart';
import 'package:csapp/models/search_result_screen_arguments.dart';
import 'package:csapp/utils/reopen_report.dart';
import 'package:csapp/utils/resolve_report.dart';
import 'package:csapp/widgets/fetch_failed.dart';
import 'package:csapp/widgets/report_details_image.dart';
import 'package:csapp/widgets/ticket_status.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportDetailsWidget extends StatefulWidget {
  const ReportDetailsWidget({
    super.key,
    required this.reportId,
    required this.reportJson,
  });

  final String reportId;
  final Map<String, dynamic>? reportJson;
  @override
  _ReportDetailsWidgetState createState() => _ReportDetailsWidgetState();
}

class _ReportDetailsWidgetState extends State<ReportDetailsWidget> {
  final _resolveReasonFormController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _resolveReasonFormController.dispose();
    super.dispose();
  }

  String getFormattedDate(DateTime dt) =>
      DateFormat("yyyy/MM/dd HH:mm:ss").format(dt).toString();
  Report? getReportFromJSON() {
    if (widget.reportJson == null) {
      return null;
    }

    return Report.fromJson(widget.reportJson!);
  }

  // 同じユーザーのレポートを表示する
  // エラーもしくはデータが１件以下場合は何も表示しない
  Widget _sameUserTicketsCount() {
    final report = getReportFromJSON();
    if (report == null) {
      return const SizedBox.shrink();
    }

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("reports")
            .where("reporterUid", isEqualTo: report.reporterUid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox.shrink();
          }

          if (snapshot.hasData) {
            if (snapshot.data!.size == 1) {
              return const SizedBox.shrink();
            }
            return Container(
                margin: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    Text(
                      "同じUIDからさらに${snapshot.data!.size - 1}件のレポートが届いています",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/search_result",
                              arguments: SearchResultScreenArguments(
                                report.reporterUid,
                              ));
                        },
                        child: const Text(
                          "同じUIDで検索",
                        ))
                  ],
                ));
          }
          return const SizedBox.shrink();
        });
  }

  Widget _ticketStatus() {
    final resolvedAt = widget.reportJson?["resolvedAt"] as Timestamp?;
    final createdAt = widget.reportJson?["createdAt"] as Timestamp?;
    final report = getReportFromJSON();
    if (report == null) {
      return const FetchFailedWidget(text: "JSONパースエラーが発生しました");
    }

    if (resolvedAt == null) {
      return Container(
          margin: const EdgeInsets.only(top: 8),
          child: Column(children: [
            Row(children: [
              TicketStatusIcon(
                resolved: report.resolved,
                small: true,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Text(
                    report.resolved
                        ? "解決済み"
                        : "未解決(${getFormattedDate(createdAt!.toDate())}時点)",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  )),
            ]),
            _sameUserTicketsCount()
          ]));
    }

    return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Row(children: [
          TicketStatusIcon(
            resolved: report.resolved,
            small: true,
          ),
          Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                report.resolved
                    ? "${getFormattedDate(resolvedAt.toDate())}に解決済み"
                    : "未解決(${getFormattedDate(createdAt!.toDate())}時点)",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ))
        ]));
  }

  void _submitResolve() async {
    await resolveReport(
        context,
        widget.reportId,
        _resolveReasonFormController.text.isEmpty
            ? '理由の記入なし'
            : _resolveReasonFormController.text);
  }

  void _reopenReport() async {
    await reopenReport(context, widget.reportId);
  }

  Widget _ticketOperation() {
    final report = getReportFromJSON();
    if (report == null) {
      return const FetchFailedWidget(text: "JSONパースエラーが発生しました");
    }

    if (report.resolved) {
      return Container(
          margin: const EdgeInsets.only(top: 8),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: OutlinedButton(
                  onPressed: _reopenReport,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const StadiumBorder(),
                      side: const BorderSide(width: 2, color: Colors.blue),
                      minimumSize: const Size(double.infinity, 48)),
                  child: const Text(
                    "未解決に戻す",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ]));
    }

    return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Form(
            key: _formKey,
            child: Form(
                child: Column(children: [
              TextField(
                controller: _resolveReasonFormController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: const InputDecoration(
                    hintText: "解決の理由をご記入ください",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: OutlinedButton(
                    onPressed: _submitResolve,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const StadiumBorder(),
                        side: const BorderSide(width: 2, color: Colors.blue),
                        minimumSize: const Size(double.infinity, 48)),
                    child: const Text(
                      "解決にマーク",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]))));
  }

  @override
  Widget build(BuildContext context) {
    final report = getReportFromJSON();
    if (report == null) {
      return const FetchFailedWidget(text: "JSONパースエラーが発生しました");
    }

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ReportDetailsImage(reportId: widget.reportId),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "詳細",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    report.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Text(
                      "メタ情報",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    )),
                _ticketStatus(),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Text(
                      "チケット操作",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    )),
                _ticketOperation(),
              ],
            ),
          )
        ])));
  }
}
