import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../enums/error_dialog_answers.dart';

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
