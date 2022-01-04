import 'package:flutter/material.dart';
import 'package:flutter_application_demo/Utils/routes.dart';
import 'package:flutter_application_demo/core/store.dart';
import 'package:flutter_application_demo/pages/cart_page.dart';
import 'package:flutter_application_demo/pages/home_page.dart';
import 'package:flutter_application_demo/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    //  home: HomePage(),
     themeMode: ThemeMode.system,
     darkTheme: ThemeData(
       brightness: Brightness.dark,
       fontFamily: GoogleFonts.lato().fontFamily
     ),
     routes: {
       "/" : (context)=> HomePage(),
       MyRoutes.homeRoute: (context) => HomePage(),
       MyRoutes.loginRoute: (context) => LoginPage(),
       MyRoutes.cartRoute: (context) => CartPage(),
     },
    );
  }
}
// return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//     //  home: HomePage(),
//      themeMode: ThemeMode.light,
//      theme: MyTheme.lightTheme(context), 
//      darkTheme: MyTheme.darkTheme(context),
//      initialRoute: MyRoutes.homeRoute,
//      routes: {
//        "/" : (context)=> HomePage(),
//        MyRoutes.homeRoute: (context) => HomePage(),
//        MyRoutes.loginRoute: (context) => LoginPage(),
//      },
//     )