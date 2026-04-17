import 'package:dash_bord_fruite_hup/cart/domain/entitis/cart_item_entitis.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/add_product_input_entity.dart';

class CartEntiti {
  List<CartItementity> cartItems;

  CartEntiti({required this.cartItems});

  
     
     getquantity(Productentity productentity) {
    for (var item in cartItems) {
      if (item.productentity.code == productentity.code) {
        return item.quantity;
      }
    }
    return 0;
  }
     
     
     
     calculatetotalprice() {
    double totalprice = 0;
    for (var item in cartItems) {
      totalprice += item.caluclatetotalpriceitem();
    }
    return totalprice;
     }


   calculatetotalwieght() {
    double totalwieght = 0;
    for (var item in cartItems) {
      totalwieght += item.caluclatetotalwieght();
    }
    return totalwieght;
  }

  additemtocart(CartItementity cartItementity) {
    cartItems.add(cartItementity);
  }

  removeitemfromcart(CartItementity cartItementity) {
    cartItems.remove(cartItementity);
  }

  CartItementity getitem(Productentity productentity) {
    for (var item in cartItems) {
      if (item.productentity.code == productentity.code) {
        return item;
      }
    }
    return CartItementity(productentity: productentity, quantity: 1);
  }

  bool isitemincart(Productentity productentity) {
    for (var item in cartItems) {
      if (item.productentity.code == productentity.code) {
        return true;
      }
    }
    return false;
  }
}
