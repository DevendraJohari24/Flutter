import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/widgets/header.dart';
import  'package:insta_app/pages/home.dart';
import 'package:insta_app/widgets/progress.dart';
import 'package:timeago/timeago.dart' as timeago;
class Comments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String postMedialUrl;

  Comments({this.postId,this.postMedialUrl,this.postOwnerId});
  @override
  CommentsState createState() => CommentsState(
    postId:  this.postId,
    postOwnerId: this.postOwnerId,
    postMedialUrl: this.postMedialUrl,
  );
}

class CommentsState extends State<Comments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String postOwnerId;
  final String postMedialUrl;

  CommentsState({this.postId,this.postMedialUrl,this.postOwnerId});

  buildComments(){
      return StreamBuilder(stream: commentsRef.doc(postId).collection("comments").orderBy("timestamp", descending: false).snapshots(),
          builder: (context, snapshot){
        if(!snapshot.hasData){
          return circularProgress();
        }
        List<Comment> comments = [];
        snapshot.data.documents.forEach((doc){
          comments.add(Comment.fromDocument(doc));
        });
        return ListView(children: comments,);
          });
  }
  addComment(){
    commentsRef
      .doc(postId)
        .collection("comments")
        .add({
      "username": currentUser.username,
      "comment": commentController.text,
      "timestamp": timestamp,
      "avatarUrl": currentUser.photoUrl,
      "userId": currentUser.id,
    });
    commentController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Comments"),
      body: Column(
        children: [
          Expanded(child: buildComments()),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                labelText: "Write a comment!....",
              ),
            ),
            trailing: OutlineButton(
              onPressed: addComment,
              borderSide: BorderSide.none,
              child: Text("Post"),
            ),
          )

        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;
  Comment({
    this.timestamp,
    this.username,
    this.avatarUrl,
    this.comment,
    this.userId,
});
  factory Comment.fromDocument(DocumentSnapshot doc){
    return Comment(
      username: doc['username'],
      userId: doc['userId'],
      comment: doc['comment'],
      timestamp: doc['timestamp'],
      avatarUrl: doc['avatarUrl'],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(comment),
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          subtitle: Text(timeago.format(timestamp.toDate())),
        ),
        Divider(),
      ],
    );
  }
}
