import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newone/screens/signin_screen.dart';
import 'package:newone/screens/utils.dart';


import '../reusable_widgets/reusable_widget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = new TextEditingController();
  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Sign Up", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold ),),
        ),
        body: Container(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4"),
              ],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false, _userNameTextController),
                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                firebasebutton(context, 'SignUp', () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    print("Account Created");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInScreen()));
                  }).onError((error, stackTrace)  {
                    print("Error ${error.toString()}");
                  });


                } ),



              ],


            ),),),
        )




    );
  }
}

