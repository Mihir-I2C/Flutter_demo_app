import 'package:demoapp/Home_Widget/Addto_Cart.dart';
import 'package:demoapp/Model/Catalogmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor:Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red400.make(),
            AddToCart(catalog: catalog,).wh(100, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 12,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image).centered()),
                ),
              ).wh32(context).w56(context).centered(),
            ),
            Expanded(
              child: VxArc(
                height: 30,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .bold
                          .make(),
                  ("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros,"+
                   "pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus."+
                   "Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex,").text.textStyle(context.captionStyle).align(TextAlign.justify).make().p16(),
                  ],
                  ).pOnly(top:64,left:15,right:15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
