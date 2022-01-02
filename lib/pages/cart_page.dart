import 'package:flutter/material.dart';
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
          CartList().p32().expand(),
          Divider(),
          _CardToal(),
        ],
      ),
    );
  }
}

class _CardToal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(Colors.black).make(),
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

class CartList extends StatefulWidget {
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items!.isEmpty
        ? "No data found in list".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  title: _cart.items?[index].name.text.make(),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      _cart.items?.removeAt(index);
                      setState(() {});
                    },
                  ),
                ));
  }
}
