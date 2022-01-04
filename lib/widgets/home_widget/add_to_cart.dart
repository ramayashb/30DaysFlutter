import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_demo/core/store.dart';
import 'package:flutter_application_demo/models/cart.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

class AddToCard extends StatelessWidget {
  final Item catalog;

  AddToCard({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listen = VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items?.contains(catalog) ?? false;

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
