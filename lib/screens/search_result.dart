import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/widgets/all_done.dart';
import 'package:csapp/widgets/fetch_failed.dart';
import 'package:csapp/widgets/ticket_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/search_result_screen_arguments.dart';

enum TicketMenuItem { toggleStatus }

enum AppBarMenuItem { showResolvedTickets, signOut }

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool _showResolvedTickets = false;

  List<Widget> _getAppBarOptions() {
    return [
      PopupMenuButton<AppBarMenuItem>(
        onSelected: (AppBarMenuItem item) {
          switch (item) {
            case AppBarMenuItem.showResolvedTickets:
              setState(() {
                _showResolvedTickets = !_showResolvedTickets;
              });
              break;
            case AppBarMenuItem.signOut:
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("警告"),
                    content: const Text("ログアウトします。よろしいですか？"),
                    actions: <Widget>[
                      // ボタン領域
                      TextButton(
                        child: const Text("キャンセル"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                          Navigator.of(context).pushReplacementNamed("/login");
                        },
                      ),
                    ],
                  );
                },
              );
              break;
          }
        },
        itemBuilder: (context) => <PopupMenuEntry<AppBarMenuItem>>[
          PopupMenuItem<AppBarMenuItem>(
            value: AppBarMenuItem.showResolvedTickets,
            child: Text(_showResolvedTickets ? "解決済みチケットを隠す" : "解決済みチケットを表示する"),
          ),
          const PopupMenuItem<AppBarMenuItem>(
              value: AppBarMenuItem.signOut, child: Text('ログアウト'))
        ],
      )
    ];
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _getDocumentsByReporterUid(
      String reporterUid) {
    if (_showResolvedTickets) {
      return FirebaseFirestore.instance
          .collection("reports")
          .where("reporterUid", isEqualTo: reporterUid)
          .snapshots();
    }
    return FirebaseFirestore.instance
        .collection("reports")
        .where("resolved", isEqualTo: false)
        .where("reporterUid", isEqualTo: reporterUid)
        .snapshots();
  }

  Widget _ticketList() {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as SearchResultScreenArguments;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _getDocumentsByReporterUid(arguments.reporterUid),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;

            if (docs.isEmpty) {
              return const AllDoneWidget();
            }

            return TicketListWidget(ticketsData: docs);
          }
          return const FetchFailedWidget(
            text: "表示できるデータがありません",
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("検索結果"),
          actions: _getAppBarOptions(),
        ),
        body: _ticketList());
  }
}
