import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int days = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catelog App"),
      ),
      body: Center(child: Container(child: Text("hi $days"))),
      drawer: Drawer(),
    );
  }
}
