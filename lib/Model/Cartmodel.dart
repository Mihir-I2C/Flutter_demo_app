import 'package:demoapp/Core/Store.dart';
import 'package:demoapp/Model/Catalogmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field

  // single tun class one object is all place use
  // static final cartModel=CartModel._internal();
  // CartModel._internal();
  // factory CartModel()=>cartModel;

  CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel value) {
    assert(value != null);
    _catalog = value;
  }

  //Collection of IDs -store ids each items
  final List<int> _itemIds = [];

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  //get total price

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // remove item
//   void remove(Item item) {
//     _itemIds.remove(item.id);
//   }
}

class AddMutetion extends VxMutation<MyStore>{
  final Item item;
  AddMutetion(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}
class RemoveMutetion extends VxMutation<MyStore>{
  final Item item;
  RemoveMutetion(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}