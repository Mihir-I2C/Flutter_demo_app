import 'package:demoapp/Core/Store.dart';
import 'package:demoapp/Model/Cartmodel.dart';
import 'package:demoapp/Model/Catalogmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class AddToCart extends StatelessWidget {
  final Item catalog;
   AddToCart({Key key,this.catalog,}):super(key: key);


  // final _cart =CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to :[AddMutetion,RemoveMutetion]);
      final CartModel _cart =(VxState.store as MyStore).cart;
      // final CatalogModel _catalog =(VxState.store as MyStore).catalog;
    bool isInCart =_cart.items.contains(catalog)?? false;
    return ElevatedButton(  
      onPressed: (){
        if(!isInCart){
          // isInCart=isInCart.toggle();
          // final _catalog=CatalogModel();
          // _cart.catalog=_catalog;
          // _cart.add(catalog);
          AddMutetion(catalog);
        }
      },

      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child:isInCart?Icon(Icons.done): Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}