import 'package:demoapp/Model/Cartmodel.dart';
import 'package:demoapp/Model/Catalogmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{

CatalogModel catalog;
CartModel cart;

    MyStore(){
      catalog=CatalogModel();
      cart=CartModel();
      cart.catalog=catalog;
    }


}