import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_demo/models/cart.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class AddToCard extends StatefulWidget {
   final Item catalog;

  const AddToCard({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items?.contains(widget.catalog) ?? false;

    return ElevatedButton(
        onPressed: () {
         if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();
            _cart.catalog = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
         }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
