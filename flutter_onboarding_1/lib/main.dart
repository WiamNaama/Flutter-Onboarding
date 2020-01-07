import 'package:flutter/material.dart';

//import screens

import 'Screens/f_sceen-1.dart';

void main (){
  runApp(UI_01());
}

class UI_01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,

     home:Onboarding_1() ,
   );
  }
}