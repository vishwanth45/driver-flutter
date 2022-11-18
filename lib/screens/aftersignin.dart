 import 'package:flutter/material.dart';
import 'package:newone/screens/utils.dart';


class AfterSignIN extends StatefulWidget {
const AfterSignIN({Key? key}) : super(key: key);

@override
State<AfterSignIN> createState() => _AfterSignINState();
}

class _AfterSignINState extends State<AfterSignIN> {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Modules'),
backgroundColor: Colors.pink,
),
body: Container(
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
onPressed: (){
Navigator.pushNamed(context, 'userlogin');
},
child: Text('User',)),
ElevatedButton(
style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
onPressed: (){
Navigator.pushNamed(context, 'driverlogin');
},
child: Text('Driver',)),

],
),
),
)
);
}
}