import 'package:flutter/material.dart';
import 'package:flutter_application_demo/models/cart.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:flutter_application_demo/pages/home_detail_page.dart';
import 'package:flutter_application_demo/widgets/home_widget/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalogItem = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalogItem
                )
              )
            ),
          child: CatalogItem(catalog: catalogItem)
          );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
           tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.color(Colors.black).bold.make(),
            catalog.desc.text.caption(context).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              // buttonPadding: Vx.mOnly(right: 8),
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                10.heightBox,
                 _addToCard(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(100).make().py16();
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
