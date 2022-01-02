import 'package:flutter_application_demo/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  //Catalog field
  late CatalogModel _catalog;

  //Collection of Ids
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item>? get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items!.fold(0, (total, current) => total + current.price);
//Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

//Remove item
  void remov(Item item) {
    _itemIds.removeAt(item.id);
  }
}
