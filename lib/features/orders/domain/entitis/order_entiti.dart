
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_productes_entiti.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/address_entiti.dart';

class OrderEntiti {
String ?id;
  String ?uiID;
 List<OrderProductesEntiti> ?orderItems;
 int ?ispymentmethod;
 String ?status;
 AddressEntiti? addressEntiti;
 double ?totalPrice;


 OrderEntiti({this.id,required this.uiID ,this.orderItems, this.ispymentmethod, this.addressEntiti, this.totalPrice,this.status});
 
}