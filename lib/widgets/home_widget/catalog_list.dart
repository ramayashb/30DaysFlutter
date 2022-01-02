import 'package:flutter/material.dart';
import 'package:flutter_application_demo/models/catalog.dart';
import 'package:flutter_application_demo/pages/home_detail_page.dart';
import 'package:flutter_application_demo/widgets/home_widget/catalog_image.dart';
import 'package:flutter_application_demo/widgets/home_widget/add_to_cart.dart';
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
                AddToCard(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(100).make().py16();
  }
}

