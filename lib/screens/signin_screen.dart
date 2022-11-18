import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newone/screens/aftersignin.dart';
import 'package:newone/screens/reset_password.dart';
import 'package:newone/screens/signup_screen.dart';
import 'package:newone/screens/utils.dart';


import '../reusable_widgets/reusable_widget.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
                begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(child: Padding(padding: EdgeInsets
            .fromLTRB(
            20, MediaQuery
            .of(context)
            .size
            .height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
             // logoWidget('assets/design.jpg'),

              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
              SizedBox(
                height: 8,
              ),
              forgetPassword(context),


              firebasebutton (context,'SignIn', () {
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AfterSignIN()));
                } ).onError((error, stackTrace) {
                  print("Incorrect password ${error.toString()}");
                });

              } ),
              signUpOption()
            ],
          ),
        ),),
      ),

    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont Have Account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(" Sign Up",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

          ),

        )



      ],

    );
  }
  Widget forgetPassword(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(child: Text("Forget Password?",
        style:TextStyle(color: Colors.white),
        textAlign: TextAlign.right,), onPressed: () =>
        Navigator.push(context, MaterialPageRoute(builder: (context) =>ResetPassword() ))



      ),
    );
  }


}
