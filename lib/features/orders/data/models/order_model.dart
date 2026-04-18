

import 'package:dash_bord_fruite_hup/features/orders/data/models/order_productes_modle.dart';
import 'package:dash_bord_fruite_hup/features/orders/data/models/shaiping_Addres_modle.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/address_entiti.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_entiti.dart';

class OrderModel {
String uid;
final double total;
final ShaipingAddresModle address;

final List<OrderProductesModle> products;
final int PaymentMethod;

OrderModel({
  required this.uid,
  required this.total,
  required this.address,
  required this.products,
  required this.PaymentMethod
});

 OrderEntiti toEntiti() {
  return OrderEntiti(
    uiID: uid,
    totalPrice: total,
    orderItems: products.map((e) => e.toentiti()).toList(),
    addressEntiti: address.toentites(),
    ispymentmethod: PaymentMethod,
  );
}

factory OrderModel.fromjson(Map<String,dynamic>json){
return OrderModel(
  uid: json["uid"] ?? "",
  total: (json["total"] as num?)?.toDouble() ?? 0.0,
  address: ShaipingAddresModle.fromjson(json["address"] ?? {}),
  products: (json["products"] as List?)?.map((e) => OrderProductesModle.fromjson(e)).toList() ?? [],
  PaymentMethod: json["paymentMethod"] ?? 0,
);
}

factory OrderModel.fromentitis(OrderEntiti orderEntiti){
double totalPrice = 0;
List<OrderProductesModle> productList = [];
if (orderEntiti.orderItems != null) {
  totalPrice = orderEntiti.orderItems!.fold<double>(0.0, (sum, item) => sum + (item.price * item.quantity));
  productList = orderEntiti.orderItems!.map((e) => OrderProductesModle(
    name: e.name ?? "",
    price: e.price,
    description: e.description ?? "",
    image: e.image ?? "",
    code: e.code ?? "",
    quantity: e.quantity
  )).toList();
}
return OrderModel(
  uid: orderEntiti.uiID??"",
  total: totalPrice,
  address: ShaipingAddresModle.fromentitis(
  orderEntiti.addressEntiti ?? AddressEntiti()
),
  products: productList,
  PaymentMethod: orderEntiti.ispymentmethod??0,
);


}
toJson() {
  return {
    "uid": uid,
    "total": total,
    "address": address.tojson(),
    "products": products.map((e) => e.tojson()).toList(),
    "paymentMethod": PaymentMethod,
  };
}

}