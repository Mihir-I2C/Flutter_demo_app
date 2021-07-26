import 'package:demoapp/Core/Store.dart';
import 'package:demoapp/Model/Cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,),
      body: Column(
        children: [
          _CartListState().p32().expand(),
          // Divider(),
        ],
      ),
      bottomNavigationBar:  Carttotal().h(80),
    );
  }
}

class Carttotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart =(VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutetion},
            builder:(context,_)=> ("\$${_cart.totalprice}".text.xl5.color(context.theme.accentColor).make()),
        ),
          30.widthBox,
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make(),));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                  // shape: MaterialStateProperty.all(StadiumBorder())
              ),
              child: "Buy".text.color(Colors.white).make()).w24(context),
        ],
      ),
    ).objectBottomCenter();
  }
}



class _CartListState extends StatelessWidget{
  // final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to: [RemoveMutetion]);
    final CartModel _cart =(VxState.store as MyStore).cart;
    return _cart.items?.isEmpty ? "Nothing in Cart".text.xl3.make().centered(): ListView.builder(
         itemCount:_cart.items.length ,
         itemBuilder: (context,index)=>ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
           icon: Icon(Icons.remove_circle_outline),
            onPressed: ()=> RemoveMutetion(_cart.items[index]),
              // _cart.remove(_cart.items[index]);

              // setState(() {});
            // },
           ),
           // title:_cart.items[index].name.text.make(),
           title:_cart.items[index].name.text.make(),
        ),
    );
  }
}
