
import 'package:dash_bord_fruite_hup/cart/domain/entitis/cart_item_entitis.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_productes_entiti.dart';

class OrderProductesModle  {
 String name;
  double price;
  String description;
  String image;
  String code;
  int quantity;

  OrderProductesModle({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.code,
    required this.quantity,
  });

OrderProductesEntiti toentiti(){
  return OrderProductesEntiti(
    name: name, 
    price: price, 
    description: description, 
    image: image, 
    code: code, 
    quantity: quantity
  );
}


factory OrderProductesModle.fromjson(Map<String,dynamic>json){
  return OrderProductesModle(
    name: (json["name"] as String?) ?? "",
    price: (json["price"] as num?)?.toDouble() ?? 0.0,
    description: (json["description"] as String?) ?? "",
    image: (json["image"] as String?) ?? "",
    code: (json["code"] as String?) ?? "",
    quantity: (json["quantity"] as num?)?.toInt() ?? 0
  );
}


factory OrderProductesModle.fromentitis(CartItementity cartItementity){
  return OrderProductesModle(
    name: cartItementity.productentity.name,
    price: cartItementity.productentity.price,
    description: cartItementity.productentity.description,
    image: cartItementity.productentity.imageURL??"",
    code: cartItementity.productentity.code,
    quantity: cartItementity.quantity
  );
  
  
}


tojson(){
  return{
    "name":name,
    "price":price,
    "description":description,
    "image":image,
    "code":code,
    "quantity":quantity
  };
}


}