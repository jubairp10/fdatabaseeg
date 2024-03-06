import 'package:fdatabaseeg/fhomepge.dart';
import 'package:fdatabaseeg/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebasehelper.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey:'AIzaSyCLEfjJ5NmkfMSMLppEbwIapZvhvp1Bexw', appId: '1:819998423144:android:1783b05cdddd7e6cdb63dd', messagingSenderId: '', projectId:'fir-example-c0bb0')
  );
  User? user=FirebaseAuth.instance.currentUser;

runApp(MaterialApp(
  home:user==null?
  login():fhome()));
}
class login extends StatelessWidget{
  var email_controller=TextEditingController();
  var pass_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
       children: [
         SizedBox(height: 70,),
         Text('LOGIN here!'),
         Padding(
           padding: const EdgeInsets.all(20),
           child: TextField(
             decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),labelText: 'username',hintText: 'E-mail/name'),
             controller: email_controller,
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(20),
           child: TextField(
             decoration: InputDecoration(hintText: 'Password',prefixIcon:Icon(Icons.password),border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),suffixIcon: Icon(Icons.visibility),),
             controller: pass_controller,
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(right: 40,left: 40,top: 20),
           child: MaterialButton( color: Colors.pink,
             textColor: Colors.white,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0),
             ),onPressed: (){
             String email=email_controller.text.trim();
             String pass=pass_controller.text.trim();
             FireBaseHelper()
              .loginUser(email:email,password:pass)
               .then((result){
                 if(result==null){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>fhome()));
                 }else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.blue,content:Text(result)));
                 }
             });
             },child: Text('LOGIN'),),
         ),
         TextButton(
             onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> regfirebase()));
             },
             child: const Text('Not a User? Register Here!!!'))
       ],
     ),
   );
  }

}