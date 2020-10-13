import 'package:you_chat/widgets/chat_list.dart';
import 'package:you_chat/widgets/firestore_list_animations.dart';
import 'package:you_chat/widgets/firestore_message_stream.dart';
import 'package:you_chat/widgets/text_composer.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final GoogleSignIn googleSignIn =  GoogleSignIn();
final usersRef = FirebaseFirestore.instance.collection('chat_messages');
final DateTime timestamp = DateTime.now();
User currentUser;
enum MenuItem {signout}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isAuth = false;
  final List<Map<String, dynamic>> _dummySnapshot = [];
  @override
  void initState(){
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err){
      print('Error Signing in: $err');
    });
    //Reauthenticate when user reopened app

    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err){
      print('Error Signing in: $err');
    });
  }
  handleSignIn(GoogleSignInAccount account){
    if(account != null){
      setState(() {
        isAuth = true;
      });
    }else{
      setState(() {
        isAuth = false;
      });
    }
  }

  login(){
    googleSignIn.signIn();
  }

  logout(){
    googleSignIn.signOut();
  }


  void _sendMessageCallback(String text) {
    setState(() {
      _dummySnapshot.insert(0, {
        'name': googleSignIn.currentUser.displayName,
        'avatarUrl': googleSignIn.currentUser.photoUrl,
        'photoUrl': '',
        'text': text,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isAuth == false)
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  login();
                },
              ),
            ],
          ),
        ),
      );
    else
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('YouChat'),
          actions: <Widget>[
            PopupMenuButton<MenuItem>(
              onSelected: (MenuItem menuItem) {
                setState(() {
                  logout();
                });
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<MenuItem>>[
                PopupMenuItem<MenuItem>(
                  value: MenuItem.signout,
                  child: Text('Google Signout'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            FirestoreListAnimation(),
            Divider(height: 1.0,),
            TextComposer(currentUser: googleSignIn.currentUser,),
          ],
        ),
      );
  }
}
