import 'package:flutter/material.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:flutter_application_demo/widgets/drawer.dart';
import 'package:flutter_application_demo/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int days = 30;
    //final dummyList = List.generate(5, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catelog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: CatalogModel.items[index],);
            },
          ),
      ),
      drawer: MyDrawer(),
    );
  }
}
