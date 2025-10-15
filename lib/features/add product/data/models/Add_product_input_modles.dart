// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/add_product_input_entity.dart';


class AddProductInputModles   {
 String name;
  String price;
  String description;
  File image;
  String code;
  bool isFeatured;
  String? imageURL;
  AddProductInputModles({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageURL,
  });
  factory AddProductInputModles.fromentity(Addproductinputentity addproductinputentity){
    return AddProductInputModles(
      name: addproductinputentity.name,
      price: addproductinputentity.price,
      description: addproductinputentity.description,
      image: addproductinputentity.image,
      code: addproductinputentity.code,
      isFeatured: addproductinputentity.isFeatured,
      imageURL: addproductinputentity.imageURL,
    );
  }




 ToMap(){
   return {
     "name":name,
     "price":price,
     "description":description,
     "image":image,
     "code":code,
     "isFeatured":isFeatured,
     "imageURL":imageURL,
   }; 


 }

  
     

}
