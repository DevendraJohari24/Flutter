import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();
}

class _HomeState extends State <Home>{
  bool _loading = true;
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 85,),
            Text('TeachableMachine.com CNN', style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
            ),
            ),
            SizedBox(height: 6,),
            Text('Detects Dogs and Cats', style: TextStyle(color: Colors.grey[800]
            ,
            fontWeight: FontWeight.w500, fontSize: 28),),
            SizedBox(height: 40,),
            Center(child: _loading ? Container(
              width: 280,
              child: Column(
                children: [
                  Image.asset('assets/cat.png'),
                  SizedBox(height: 50,),
                ],
              ),
            ) : Container() ,),
            Container(width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: MediaQuery.of(context).size.width-150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 17 ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Take a Photo',
                    style: TextStyle(
                      color: Colors.black,

                    ),),
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: MediaQuery.of(context).size.width-150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 17 ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Camera Roll',
                      style: TextStyle(
                        color: Colors.black,

                      ),),
                  ),
                ),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}