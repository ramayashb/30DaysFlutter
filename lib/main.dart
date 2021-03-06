import 'package:flutter/material.dart';
import 'package:flutter_application_demo/Utils/routes.dart';
import 'package:flutter_application_demo/pages/home_page.dart';
import 'package:flutter_application_demo/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    //  home: HomePage(),
     themeMode: ThemeMode.light,
     darkTheme: ThemeData(
       brightness: Brightness.dark,
       fontFamily: GoogleFonts.lato().fontFamily
     ),
     routes: {
       "/" : (context)=> LoginPage(),
       MyRoutes.homeRoute: (context) => HomePage(),
       MyRoutes.loginRoute: (context) => LoginPage(),
     },
    );
  }
}
