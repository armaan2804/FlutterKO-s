import 'package:flutter/material.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

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
              child:
                  Text(post.likes.toString(), style: TextStyle(fontSize: 20)),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
            IconButton(
                icon: Icon(Icons.thumb_up),
                splashColor: Colors.orange[50],
                hoverColor: Colors.orange[100],
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                onPressed: () => like(post.likePost),
                color: post.userLiked ? Colors.orange[300] : Colors.grey)
          ])
        ]));
      },
    );
  }
}
