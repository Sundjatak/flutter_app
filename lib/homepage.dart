import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'view/chuck_categories_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.email, this.logoutCallback})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  final String email;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var userName = widget.email;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("$userName"),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: signOut)
        ],
      ),
      body: new Container(
        child: GetChuckCategories()
      ),
    );
  }
}