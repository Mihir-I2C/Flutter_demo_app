import 'dart:async';

import 'package:demoapp/Core/Store.dart';
import 'package:demoapp/Home_Widget/Addto_Cart.dart';
import 'package:demoapp/Model/Cartmodel.dart';
import 'package:demoapp/Model/Catalogmodel.dart';
import 'package:demoapp/Pages/home_detail_page.dart';
import 'package:demoapp/Utils/MyRoutes.dart';
import 'package:demoapp/Widget/Themes.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _connectionStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;
  final int no = 5;
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          _connectionStatus = result.toString();
          print(_connectionStatus);
          if (result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) {
            LoadData();
            setState(() {});
          }
          else{
            Fluttertoast.showToast(
                msg: "No data connection !!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                // backgroundColor: Colors.red,
                textColor: Mytheme.darkbluishcolor,
                fontSize: 16.0
            );
          }
        });

  }

  LoadData() async {

    await Future.delayed(Duration(seconds: 2));
    // json to get data
    // final catalogjson = await rootBundle.loadString("asset/Files/catalog.json");
    // upi through get data
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    // string to other formate use decode
    //string to map
    final decoddata = jsonDecode(catalogJson);
    var products = decoddata["products"];
    // print(products.toString());
    CatalogModel.items =
        List.from(products).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummylist=List.generate(25, (index) =>CatalogModel.items[0]);
   final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutetion,RemoveMutetion},
        builder:(context,_)=> FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoutes),
          backgroundColor: context.theme.buttonColor,
          child: Icon(Icons.shopping_cart,color: Colors.white,),
        ).badge(color: Vx.red500,size: 20,count: _cart.items.length,textStyle: TextStyle(fontSize:12,color:Colors.white,fontWeight: FontWeight.bold)),
      ),
      backgroundColor: context.canvasColor,
      body:SafeArea(
        bottom:false,
        child: Container(
          // padding: Vx.m32,
          child: Padding(
            padding: const EdgeInsets.only(top: 32,left: 32,right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if(CatalogModel.items!=null)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        "Demo App".text.xl4.bold.color(context.theme.accentColor).make(),
        "Trending products".text.xl2.bold.make(),
    ],
    );
  }
}

class  CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          itemCount: CatalogModel.items.length,
          itemBuilder: (context,index){
          final catalog=CatalogModel.items[index];
          return InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog,),)),
              child: CatalogItem(catalog:catalog));
         },
    );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key key, @required this.catalog}) :assert(catalog!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child:Row(
          children: [
            SizedBox(width: 5,),
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).box.rounded.p8.color(context.canvasColor).make().wh(100,100)
            ),
            SizedBox(width: 5,),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      catalog.name.text.xl.color(context.accentColor).bold.make(),
                      catalog.desc.text.textStyle(context.captionStyle).bold.make().w56(context),
                      10.heightBox,
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          "\$${catalog.price}".text.bold.xl.make(),
                          AddToCart(catalog:catalog),
                        ],
                      ).pOnly(right: 8.0).pOnly(bottom: 2),
                    ]
                ))
          ],
        ),
    ).color(context.cardColor).shadowSm.rounded.square(100).make().py16().h20(context);

  }
}



