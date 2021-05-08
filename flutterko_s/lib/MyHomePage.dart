import 'package:flutter/material.dart';
import 'post.dart';
import 'TextInputWidget.dart';
import 'PostList.dart';
import 'database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;

  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      if (text != "") {
        posts.add(post);
      }
    });
  }

  void updateMessages() {
    getAllMessages().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updateMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterKO-s'),
      ),
      body: Column(children: <Widget>[
        Expanded(child: PostList(this.posts, widget.user)),
        TextInputWidget(this.newPost)
      ]),
    );
  }
}
