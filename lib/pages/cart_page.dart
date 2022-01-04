import 'package:flutter/material.dart';
import 'package:flutter_application_demo/core/store.dart';
import 'package:flutter_application_demo/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      backgroundColor: context.canvasColor,
      body: Column(
        children: [
          _CartListState().p32().expand(),
          Divider(),
          _CardToal(),
        ],
      ),
    );
  }
}

class _CardToal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, object, status) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(Colors.black)
                    .make();
              },
              ),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not suppported yet.".text.make(),
                ));
              },
              child: "Bye".text.color(context.canvasColor).make()),
        ],
      ),
    );
  }
}

class _CartListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items!.isEmpty
        ? "No data found in list".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  title: _cart.items?[index].name.text.make(),
                  trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => RemoveMutation(_cart.items![index])),
                ));
  }
}
