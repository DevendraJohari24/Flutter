
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class TextComposer extends StatefulWidget {

  final GoogleSignInAccount currentUser;

  const TextComposer({Key key, this.currentUser}) : super(key: key);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> with
  TickerProviderStateMixin {
  var parser = EmojiParser();
  var coffee = Emoji('coffee', '☕');
  var heart  = Emoji('heart', '❤️');
  final TextEditingController _textEditingController = TextEditingController();

  bool _isComposing = false;
  final ImagePicker _picker = ImagePicker();
  File imageFile;
  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });

    _sendMessage(text: text);
  }

  void _sendMessage({String text, String photoUrl}) {
    print("path-----> $photoUrl");
    setState(() {
      FirebaseFirestore.instance.collection('chat_messages').doc()
          .set({
        'name': widget.currentUser.displayName,
        'avatarUrl': widget.currentUser.photoUrl,
        'photoUrl': photoUrl,
        'text': text,
        'timestamp' : DateTime.now().millisecondsSinceEpoch,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.photo),
                onPressed: () async{
                  final pickedFile = await _picker.getImage(
                    source: ImageSource.gallery,
                    maxWidth: 400.0,
                    maxHeight: 300.0,
                  );
                  imageFile = File(pickedFile.path);
                  final FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://loginregister-a112b.appspot.com');
                  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
                  final StorageReference ref = storage.ref().child('image_${timestamp()}.jpg');
                  final StorageUploadTask uploadTask = ref.putFile(imageFile);
                  var downloadUrl = await(await uploadTask.onComplete).ref.getDownloadURL();
                  _sendMessage(photoUrl: downloadUrl.toString());
                },
              ),
              Flexible(
                child: TextField(
                  onSubmitted: _handleSubmitted,
                  controller: _textEditingController,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  decoration: InputDecoration.collapsed(hintText: 'Send a message'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComposing ? () => _handleSubmitted(_textEditingController.text)
                  : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
