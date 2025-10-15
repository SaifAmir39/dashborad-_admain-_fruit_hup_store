import 'dart:io';

class Addproductinputentity {
  String name;
  String price;
  String description;
  File image;
  String code;
  bool isFeatured;
   String? imageURL;
  Addproductinputentity({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.code,
    required this.isFeatured,
   this.imageURL,
  });
  
}
