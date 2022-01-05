import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_demo/Utils/routes.dart';
import 'package:flutter_application_demo/core/store.dart';
import 'package:flutter_application_demo/models/cart.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:flutter_application_demo/widgets/home_widget/catalog_header.dart';
import 'package:flutter_application_demo/widgets/home_widget/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catlogJson = await rootBundle.loadString("assets/files/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catlogJson = response.body;
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
    final _cart = (VxState.store as MyStore).cart;
    final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, dynamic, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: Colors.red,
          child: Icon(CupertinoIcons.cart),
        ).badge(color: Vx.gray500, size: 20, count: _cart.items?.length),
      ),
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
