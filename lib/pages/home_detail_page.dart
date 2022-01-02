import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_demo/models/cart.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          // buttonPadding: Vx.mOnly(right: 8),
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            10.heightBox,
            _addToCard(catalog: catalog).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white70,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.color(Colors.black).bold.xl4.make(),
                    catalog.desc.text.caption(context).xl.make(),
                  ],
                ).p64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class _addToCard extends StatefulWidget {
  final Item catalog;

  const _addToCard({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_addToCard> createState() => _addToCardState();
}

class _addToCardState extends State<_addToCard> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          setState(() {});
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isAdded ? Icon(Icons.done) : "Add to cart".text.make());
  }
}
