class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color,
      this.image); //named constructor

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map["id"],
      map["name"],
      map["desc"],
      map["price"],
      map["color"],
      map["image"],
    );
  }

  toMap()=> {
    "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "color":color,
    "image":image,
  };


}

class CatalogModel {

  // static final catModel=CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel()=>catModel;

  static List<Item> items ;
  //   Item(1, "iphone 12 pro", "apple iphone 12 generation", 999, "#33505a",
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYZUj4_YISkIiy5e98BRhRGhjTdkLHYq7yQ6VF9J8Nnx8jtA04pidOAK__x_0NfOSFlVzKvPU&usqp=CAc")
  // ];
// get item by id
   Item getbyId(int id)=>items.firstWhere((element) => element.id==id, orElse: null);

    Item getByPosition(int pos) =>items[pos];
}
