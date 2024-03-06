import 'package:fdatabaseeg/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebasehelper.dart';
void main(){
  runApp(MaterialApp(home: fhome(),));
}
class fhome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(actions: [
        PopupMenuButton(itemBuilder: (context){
          return[
            PopupMenuItem(child: TextButton(onPressed: () { FireBaseHelper().logout().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>login())));
              },
            child: Text('LOGOUT',style: TextStyle(fontFamily: 'assets/fonts/Genos/static/Genos-Black.ttf'),))),
          ];
        })
      ],),
      body: Center(
        child: ListView(
          children: [
            Center(child: Text('welcome to the new venture'))
          ],
        ),
      ),
    );
  }

}