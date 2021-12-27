import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:flutter_application_demo/widgets/drawer.dart';
import 'package:flutter_application_demo/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catlogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catlogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

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
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ?
            // ListView.builder(
            //   itemCount: CatalogModel.items.length,
            //   itemBuilder: (context, index) => ItemWidget(
            //       item: CatalogModel.items[index],
            //     )
            // )
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: GridTile(
                      header: Container(
                        child: Text(item.name,
                         style: TextStyle(color: Colors.white),
                         ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple
                        ),
                        ),
                      child: Image.network(item.image),
                      footer: Container(
                        child: Text(
                          '\$${item.price}',
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                      
                      ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
