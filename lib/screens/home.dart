import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/providers/search.dart';
import 'package:csapp/widgets/all_done.dart';
import 'package:csapp/widgets/fetch_failed.dart';
import 'package:csapp/widgets/ticket_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppBarMenuItem { showResolvedTickets, signOut }

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Widget _ticketList(WidgetRef ref, bool showResolvedTickets) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: showResolvedTickets
            ? FirebaseFirestore.instance
                .collection("reports")
                .orderBy("createdAt", descending: true)
                .snapshots()
            : FirebaseFirestore.instance
                .collection("reports")
                .where("resolved", isEqualTo: false)
                .orderBy("createdAt", descending: true)
                .snapshots(),
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
    final searchState = ref.watch(searchStateProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("チケット"),
          actions: [
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
                                Navigator.of(context)
                                    .pushReplacementNamed("/login");
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
                  child: Text(searchState.showResolvedTickets
                      ? "解決済みチケットを隠す"
                      : "解決済みチケットを表示する"),
                ),
                const PopupMenuItem<AppBarMenuItem>(
                    value: AppBarMenuItem.signOut, child: Text('ログアウト'))
              ],
            )
          ],
        ),
        body: _ticketList(ref, searchState.showResolvedTickets));
  }
}
