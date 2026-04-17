import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/add_product_input_entity.dart';

class CartItementity {
Productentity productentity;
int quantity;

CartItementity({required this.productentity,this.quantity =0});

caluclatetotalpriceitem(){
  return productentity.price * quantity;
}
caluclatetotalwieght(){
  return productentity.unitaMount * quantity;
}

incresquantity(){
  quantity++;
}
decresquantity(){
  if(quantity > 0){
    quantity--;
  }
}

}