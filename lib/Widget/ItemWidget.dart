import 'package:demoapp/Model/Catalogmodel.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {

   final  Item item;
// use listview
  const ItemWidget({Key key,@required this.item}) : assert(item!=null),super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor:Colors.orange ,
      elevation: 2,
      child: ListTile(
        onTap: (){print("${item.name}pressed");},
         leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",textScaleFactor: 1.2, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
