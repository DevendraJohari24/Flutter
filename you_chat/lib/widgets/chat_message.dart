import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_chat/models/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ChatMessage extends StatelessWidget {


  final DocumentSnapshot snapshot;

  const ChatMessage({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var parser = EmojiParser();
    var coffee = Emoji('coffee', '☕');
    var heart  = Emoji('heart', '❤️');
    var pizza = Emoji('pizza', '🍕');
    var star = Emoji('star', '⭐');
    var hand = Emoji('hand', '✋');
    var v = Emoji('v', '✌');
    var sunrise = Emoji('sunrise','🌅');
    var rainbow = Emoji('rainbow', '🌈');
    var ocean = Emoji('ocean','🌊');
    var earth = Emoji('earth', '🌍');
    var newmoon = Emoji('newmoon', '🌑');
    var moon = Emoji('moon', '🌔');
    var stars = Emoji('stars', '🌠');
    var star2 = Emoji('star2', '🌟');
    var hamburger = Emoji('hamburger', '🍔');
    var icecream = Emoji('icecream', '🍦');
    var chocolatebar = Emoji('chocolatebar', '🍫');
    var tea = Emoji('tea','🍵');
    var wineglass = Emoji('wineglass', '🍷');

    final record = Record.fromSnapshot(snapshot);

    printText(){
      return record.photoUrl != null ? Image.network(record.photoUrl) : Text(parser.emojify(record.text));
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundImage: NetworkImage(record.avatarUrl),),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: printText(),
            ),
          ),
        ],
      ),
    );
  }
}
