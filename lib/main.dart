import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/models/report.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? "/login" : "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/report": (context) => const SingleReportScreen()
      }));
}

enum ErrorDialogAnswers { ok }

enum AppBarMenuItem { showResolvedTickets, signOut }

enum ReportDetailAppBarMenuItem { quickResolve }

enum TicketMenuItem { toggleStatus }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailFormController = TextEditingController();
  final _passwordFormController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _openAuthErrorDialog(BuildContext context) {
    showDialog<ErrorDialogAnswers>(
        context: context,
        builder: (BuildContext context) =>
            SimpleDialog(title: const Text("ログインに失敗しました"), children: <Widget>[
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

  void _onLoginPressed() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailFormController.text,
            password: _passwordFormController.text);
      } catch (e) {
        _openAuthErrorDialog(context);
      }
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed("/home");
    }
  }

  @override
  void dispose() {
    _emailFormController.dispose();
    _passwordFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [Color(0xff8BC6EC), Color(0xff9599E2)],
                    stops: [0.0, 1.0])),
            child: Container(
              margin: const EdgeInsets.fromLTRB(48, 0, 48, 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.train,
                      color: Colors.white,
                      size: 128.0,
                      semanticLabel: 'Train',
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 72, 0, 32),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: TextFormField(
                                controller: _emailFormController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: "メールアドレス",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blueAccent),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'メールアドレスを入力してください';
                                  }
                                  if (!EmailValidator.validate(value)) {
                                    return 'メールアドレスの形式が正しくありません';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(bottom: 32),
                                child: TextFormField(
                                  controller: _passwordFormController,
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: "パスワード",
                                    hintStyle: TextStyle(color: Colors.white),
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'パスワードを入力してください';
                                    }
                                    return null;
                                  },
                                )),
                            Center(
                                child: OutlinedButton(
                                    onPressed: _onLoginPressed,
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: const StadiumBorder(),
                                        side: const BorderSide(
                                            width: 2, color: Colors.white),
                                        minimumSize:
                                            const Size(double.infinity, 48)),
                                    child: const Text("ログイン")))
                          ],
                        ),
                      ),
                    ),
                    const Text("このアプリを使用して知り得たいずれの情報も第三者に提供することを固く禁ずる",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 12.0,
                            height: 1.5))
                  ],
                ),
              ),
            )));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getFormattedDate(DateTime dt) =>
      DateFormat("yyyy/MM/dd HH:mm:ss").format(dt).toString();
  bool _showResolvedTickets = false;

  Widget _ticketList() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _showResolvedTickets
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

            return ListView.separated(
                padding: const EdgeInsets.only(top: 10),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final report = Report.fromJson(docs[index].data());
                  final createdAt =
                      docs[index].data()["createdAt"] as Timestamp;
                  if (report.resolved) {
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/report",
                          arguments:
                              SingleReportScreenArguments(docs[index].id),
                        );
                      },
                      leading: const TicketStatusIcon(resolved: true),
                      title: Text(
                        report.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      subtitle:
                          Text('${getFormattedDate(createdAt.toDate())} 解決済'),
                      trailing: PopupMenuButton<TicketMenuItem>(
                        onSelected: (TicketMenuItem item) async {
                          switch (item) {
                            case TicketMenuItem.toggleStatus:
                              // boo boo
                              break;
                          }
                        },
                        itemBuilder: (context) =>
                            <PopupMenuEntry<TicketMenuItem>>[
                          const PopupMenuItem<TicketMenuItem>(
                            value: TicketMenuItem.toggleStatus,
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
                        arguments: SingleReportScreenArguments(docs[index].id),
                      );
                    },
                    leading: const TicketStatusIcon(resolved: false),
                    title: Text(
                      report.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    subtitle:
                        Text('${getFormattedDate(createdAt.toDate())} 未解決'),
                    trailing: PopupMenuButton<TicketMenuItem>(
                      onSelected: (TicketMenuItem item) {
                        switch (item) {
                          case TicketMenuItem.toggleStatus:
                            resolveReport(context, docs[index].id, "クイック解決");
                            break;
                        }
                      },
                      itemBuilder: (context) =>
                          <PopupMenuEntry<TicketMenuItem>>[
                        const PopupMenuItem<TicketMenuItem>(
                          value: TicketMenuItem.toggleStatus,
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
          return const FetchFailedWidget(
            text: "表示できるデータがありません",
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("チケット"),
          actions: [
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
                  child: Text(
                      _showResolvedTickets ? "解決済みチケットを隠す" : "解決済みチケットを表示する"),
                ),
                const PopupMenuItem<AppBarMenuItem>(
                    value: AppBarMenuItem.signOut, child: Text('ログアウト'))
              ],
            )
          ],
        ),
        body: _ticketList());
  }
}

class SingleReportScreenArguments {
  final String ticketId;
  const SingleReportScreenArguments(this.ticketId);
}

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

class FetchFailedWidget extends StatelessWidget {
  const FetchFailedWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 128,
            color: Colors.black12,
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ))
        ],
      ),
    );
  }
}

class AllDoneWidget extends StatelessWidget {
  const AllDoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.local_activity,
            size: 128,
            color: Colors.black12,
          ),
          Text("やりました！未解決チケットは0件です！",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45))
        ],
      ),
    );
  }
}

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
          child: Row(children: [
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
                ))
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

class ReportDetailsImage extends StatelessWidget {
  const ReportDetailsImage({Key? key, required this.reportId})
      : super(key: key);

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

class TicketStatusIcon extends StatelessWidget {
  const TicketStatusIcon({Key? key, required this.resolved, this.small})
      : super(key: key);

  final bool resolved;
  final bool? small;

  @override
  Widget build(BuildContext context) {
    if (small == true) {
      if (!resolved) {
        return Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1.25),
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              Icons.circle,
              color: Colors.green,
              size: 4,
            ));
      }

      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 1.25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.purple,
          size: 9,
        ),
      );
    }

    if (!resolved) {
      return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2.5),
              borderRadius: BorderRadius.circular(16)),
          child: const Icon(
            Icons.circle,
            color: Colors.green,
            size: 8,
          ));
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 2.5),
          borderRadius: BorderRadius.circular(16)),
      child: const Icon(
        Icons.check,
        color: Colors.purple,
        size: 18,
      ),
    );
  }
}

void _openUpdateErrorDialog(BuildContext context) {
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

Future<void> reopenReport(BuildContext context, String reportId) async {
  await FirebaseFirestore.instance.collection("reports").doc(reportId).update({
    "resolved": false,
    "resolverUid": FirebaseAuth.instance.currentUser?.uid,
    "updatedAt": Timestamp.now(),
    "resolvedAt": null,
  }).catchError((e) {
    _openUpdateErrorDialog(context);
  });
}

Future<void> resolveReport(
    BuildContext context, String reportId, String reason) async {
  await FirebaseFirestore.instance.collection("reports").doc(reportId).update({
    "resolved": true,
    "resolvedReason": reason,
    "resolverUid": FirebaseAuth.instance.currentUser?.uid,
    "updatedAt": Timestamp.now(),
    "resolvedAt": Timestamp.now(),
  }).catchError((e) {
    _openUpdateErrorDialog(context);
  });
}
