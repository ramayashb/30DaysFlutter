import 'package:flutter/material.dart';
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
      appBar: AppBar(shadowColor: Colors.white,),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                // buttonPadding: Vx.mOnly(right: 8),
                children: [
                  "\$${catalog.price}".text.bold.xl4.red800.make(),
                  10.heightBox,
                  ElevatedButton(
                      onPressed: () {
                        print(catalog.name);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "Bye".text.make()
                      ).wh(100, 50),
                ],
              ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
              ).h32(context),
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
              )
              )
          ],
        ),
      ),
    );
  }
}
