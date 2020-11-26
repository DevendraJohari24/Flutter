
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CommandInput.dart';
import 'History.dart';

class MyHomePage extends StatefulWidget{
  MyHomePageState createState() => MyHomePageState() ;
}

class MyHomePageState extends State<MyHomePage>{
  PageController pageController;
  int pageIndex = 0;
  void initState(){
    super.initState();
    pageController = PageController();

  }
  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex;
    });
  }
  onTap(int pageIndex){
    pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        children: [
            CommandInput(),
            History(),
        ],
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.screen_share)),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded))
        ],
      ),
    );
  }
}