
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_productes_entiti.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/address_entiti.dart';

class OrderEntiti {
  String ?uiID;
 List<OrderProductesEntiti> ?orderItems;
 int ?ispymentmethod;
 AddressEntiti? addressEntiti;
 double ?totalPrice;


 OrderEntiti({required this.uiID ,this.orderItems, this.ispymentmethod, this.addressEntiti, this.totalPrice});
 
}