import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:flutter_application_demo/widgets/home_widget/catalog_header.dart';
import 'package:flutter_application_demo/widgets/home_widget/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                 CircularProgressIndicator().centered().p16().expand(),
                
            ],
          ),
        ),
      ),
    );
  }
}