import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csapp/models/report.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null ? "/login" : "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen()
      }));
}

enum ErrorDialogAnswers { ok }

enum AppBarMenuItem { showResolvedTickets, signOut }

enum TicketMenuItem { toggleStatus }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFormController = TextEditingController();
  final passwordFormController = TextEditingController();
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
            email: emailFormController.text,
            password: passwordFormController.text);
      } catch (e) {
        _openAuthErrorDialog(context);
      }
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/");
    }
  }

  @override
  void dispose() {
    emailFormController.dispose();
    passwordFormController.dispose();
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
                                controller: emailFormController,
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
                                  controller: passwordFormController,
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
      DateFormat("yyyy-MM-dd HH:mm:ss").format(dt).toString();
  final _db = FirebaseFirestore.instance;
  bool _showResolvedTickets = false;

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

  Widget _ticketList() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _showResolvedTickets
            ? _db
                .collection("reports")
                .orderBy("createdAt", descending: true)
                .snapshots()
            : _db
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.local_activity,
                      size: 128,
                      color: Colors.black12,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: const Text(
                          "やりました！未解決チケットは0件です！",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ))
                  ],
                ),
              );
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
                      leading: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 2.5),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(
                          Icons.check,
                          color: Colors.purple,
                          size: 18,
                        ),
                      ),
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
                              await _db
                                  .collection("reports")
                                  .doc(docs[index].id)
                                  .update({
                                "resolved": false,
                                "resolverUid":
                                    FirebaseAuth.instance.currentUser?.uid,
                                "updatedAt": Timestamp.now(),
                              }).catchError((e) {
                                _openUpdateErrorDialog(context);
                              });
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
                    leading: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2.5),
                          borderRadius: BorderRadius.circular(16)),
                      child: const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 8,
                      ),
                    ),
                    title: Text(
                      report.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    subtitle:
                        Text('${getFormattedDate(createdAt.toDate())} 未解決'),
                    trailing: PopupMenuButton<TicketMenuItem>(
                      onSelected: (TicketMenuItem item) async {
                        switch (item) {
                          case TicketMenuItem.toggleStatus:
                            await _db
                                .collection("reports")
                                .doc(docs[index].id)
                                .update({
                              "resolved": true,
                              "resolvedReason": "クイック解決",
                              "resolverUid":
                                  FirebaseAuth.instance.currentUser?.uid,
                              "updatedAt": Timestamp.now(),
                            }).catchError((e) {
                              _openUpdateErrorDialog(context);
                            });
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
                    child: const Text(
                      "表示できるデータがありません。",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ))
              ],
            ),
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
                                Navigator.pushReplacementNamed(
                                    context, "/login");
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
