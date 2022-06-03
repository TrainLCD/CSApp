import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/models/report.dart';
import 'package:csapp/utils/get_formatted_date.dart';
import 'package:csapp/utils/reopen_report.dart';
import 'package:csapp/widgets/ticket_status.dart';
import 'package:flutter/material.dart';

import '../models/single_report_screen_arguments.dart';
import '../utils/resolve_report.dart';

enum TicketMenuItem { resolveReport, reopenTicket }

class TicketListWidget extends StatelessWidget {
  const TicketListWidget({Key? key, required this.ticketsData})
      : super(key: key);

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ticketsData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        itemCount: ticketsData.length,
        itemBuilder: (context, index) {
          final report = Report.fromJson(ticketsData[index].data());
          final createdAt = ticketsData[index].data()["createdAt"] as Timestamp;
          if (report.resolved) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/report",
                  arguments: SingleReportScreenArguments(ticketsData[index].id),
                );
              },
              leading: const TicketStatusIcon(resolved: true),
              title: Text(
                report.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              subtitle: Text('${getFormattedDate(createdAt.toDate())} 解決済'),
              trailing: PopupMenuButton<TicketMenuItem>(
                onSelected: (TicketMenuItem item) async {
                  switch (item) {
                    case TicketMenuItem.resolveReport:
                      resolveReport(context, ticketsData[index].id, "クイック解決");
                      break;
                    case TicketMenuItem.reopenTicket:
                      reopenReport(context, ticketsData[index].id);
                  }
                },
                itemBuilder: (context) => <PopupMenuEntry<TicketMenuItem>>[
                  const PopupMenuItem<TicketMenuItem>(
                    value: TicketMenuItem.reopenTicket,
                    child: Text("未解決にマーク"),
                  ),
                ],
              ),
              isThreeLine: true,
            );
          }

          return ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                "/report",
                arguments: SingleReportScreenArguments(ticketsData[index].id),
              );
            },
            leading: const TicketStatusIcon(resolved: false),
            title: Text(
              report.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            subtitle: Text('${getFormattedDate(createdAt.toDate())} 未解決'),
            trailing: PopupMenuButton<TicketMenuItem>(
              onSelected: (TicketMenuItem item) {
                switch (item) {
                  case TicketMenuItem.resolveReport:
                    resolveReport(context, ticketsData[index].id, "クイック解決");
                    break;
                  case TicketMenuItem.reopenTicket:
                    reopenReport(context, ticketsData[index].id);
                    break;
                }
              },
              itemBuilder: (context) => <PopupMenuEntry<TicketMenuItem>>[
                const PopupMenuItem<TicketMenuItem>(
                  value: TicketMenuItem.resolveReport,
                  child: Text("クイック解決"),
                ),
              ],
            ),
            isThreeLine: true,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 0.5);
        });
  }
}
