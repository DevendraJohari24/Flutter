import 'package:you_chat/widgets/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Chat',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ChatScreen(),
    );
  }
}

