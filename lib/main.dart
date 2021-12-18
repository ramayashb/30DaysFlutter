import 'package:flutter/material.dart';
import 'package:flutter_application_demo/pages/home_page.dart';
import 'package:flutter_application_demo/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
    //  home: HomePage(),
     themeMode: ThemeMode.light,
     darkTheme: ThemeData(
       brightness: Brightness.dark,
     ),
     routes: {
       "/" : (context)=> LoginPage(),
       "/home": (context) => HomePage(),
       "/login": (context) => LoginPage(),
     },
    );
  }
}
