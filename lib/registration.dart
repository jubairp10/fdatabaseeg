import 'package:fdatabaseeg/firebasehelper.dart';
import 'package:fdatabaseeg/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: regfirebase(),));
}
class regfirebase extends StatelessWidget{
  var email_controller=TextEditingController();
  var pass_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 70,),
          Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(hintText: 'Name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(hintText: 'Password',prefixIcon:Icon(Icons.password),border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),suffixIcon: Icon(Icons.visibility),),
              controller: pass_controller,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: TextField(            decoration: InputDecoration(hintText: 'Confirm Password',prefixIcon:Icon(Icons.password),border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),suffixIcon: Icon(Icons.visibility),),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(hintText: 'Email',prefixIcon: Icon(Icons.email),border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
              controller: email_controller,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
            child: ElevatedButton(onPressed: (){
              String email=email_controller.text.trim();
              String password=pass_controller.text.trim();
              FireBaseHelper().registerUser(email: email, password: password).then((result) {
                if (result == null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                }
              }
              );

            },child: Text('Register'), style: ButtonStyle(
                minimumSize:
                MaterialStateProperty.all(const Size(330, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Alredy have an account?"),
              TextButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  },
                  child: const Text(
                    "Login!!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
            ],
          )
        ],
      ),
    );
  }
  
}