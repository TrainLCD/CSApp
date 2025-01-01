import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/widgets/all_done.dart';
import 'package:csapp/widgets/fetch_failed.dart';
import 'package:csapp/widgets/ticket_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/search_result_screen_arguments.dart';
import '../providers/search.dart';

enum TicketMenuItem { toggleStatus }

enum AppBarMenuItem { showResolvedTickets, signOut }

class SearchResultScreen extends ConsumerWidget {
  const SearchResultScreen({super.key});

  List<Widget> _getAppBarOptions(BuildContext context, WidgetRef ref) {
    return [
      PopupMenuButton<AppBarMenuItem>(
        onSelected: (AppBarMenuItem item) {
          switch (item) {
            case AppBarMenuItem.showResolvedTickets:
              ref.read(searchStateProvider.notifier).toggle();
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
        itemBuilder: (BuildContext context) => <PopupMenuEntry<AppBarMenuItem>>[
          PopupMenuItem<AppBarMenuItem>(
            value: AppBarMenuItem.showResolvedTickets,
            child: Text(ref.watch(searchStateProvider).showResolvedTickets
                ? "解決済みチケットを隠す"
                : "解決済みチケットを表示する"),
          ),
          const PopupMenuItem<AppBarMenuItem>(
              value: AppBarMenuItem.signOut, child: Text('ログアウト'))
        ],
      )
    ];
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _getDocumentsByReporterUid(
      WidgetRef ref, String reporterUid) {
    if (ref.watch(searchStateProvider).showResolvedTickets) {
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

  Widget _ticketList(BuildContext context, WidgetRef ref) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as SearchResultScreenArguments;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _getDocumentsByReporterUid(ref, arguments.reporterUid),
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("検索結果"),
          actions: _getAppBarOptions(context, ref),
        ),
        body: _ticketList(context, ref));
  }
}
