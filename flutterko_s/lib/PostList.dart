import 'package:flutter/material.dart';
import 'post.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final FirebaseUser user;

  PostList(this.listItems, this.user);

  @override
  PostListState createState() => PostListState();
}

class PostListState extends State<PostList> {
  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
            child: Row(children: <Widget>[
          Expanded(
              child: ListTile(
            title: Text(post.body),
            subtitle: Text(post.author),
          )),
          Row(children: <Widget>[
            Container(
              child: Text(post.usersLiked.length.toString(),
                  style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
            IconButton(
                icon: Icon(Icons.thumb_up),
                splashColor: Colors.orange[50],
                hoverColor: Colors.orange[100],
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                onPressed: () => this.like(() => post.likePost(widget.user)),
                color: post.usersLiked.contains(widget.user.uid)
                    ? Colors.orange[300]
                    : Colors.grey)
          ])
        ]));
      },
    );
  }
}
