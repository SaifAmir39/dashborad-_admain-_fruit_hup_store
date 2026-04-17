// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dash_bord_fruite_hup/features/add%20product/data/models/review_modle.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/add_product_input_entity.dart';

class AddProductInputModles {
  String name;
  double price;
  String description;
  File image;
  String code;
  bool isFeatured;
  String? imageURL;
  bool isOrganic = false;
  int numberofcaliores;
  int unitaMount;
  int expirationsMountes;
  List<ReviewModle> reviews;
  int saleingcount=0;
  AddProductInputModles({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageURL,
    required this.numberofcaliores,
    required this.unitaMount,
    required this.expirationsMountes,
    required this.isOrganic,
    required this.reviews,
    this.saleingcount=0,
  });
  factory AddProductInputModles.fromentity(
    Productentity addproductinputentity,
  ) {
    return AddProductInputModles(
      name: addproductinputentity.name,
      price: addproductinputentity.price,
      description: addproductinputentity.description,
      image: addproductinputentity.image,
      code: addproductinputentity.code,
      isFeatured: addproductinputentity.isFeatured,
      imageURL: addproductinputentity.imageURL,
      numberofcaliores: addproductinputentity.numberofcaliores,
      unitaMount: addproductinputentity.unitaMount,
      expirationsMountes: addproductinputentity.expirationsMountes,
      isOrganic: addproductinputentity.isOrganic, reviews: addproductinputentity.reviews.map((e) => ReviewModle.fromEntity(e)).toList(),
    );
  }

  ToMap() {
    return {
      "name": name,
      "price": price,
      "description": description,
      "code": code,
      "isFeatured": isFeatured,
      "imageURL": imageURL,
      "numberofcaliores": numberofcaliores,
      "unitaMount": unitaMount,
      "expirationsMountes": expirationsMountes,
      "isOrganic": isOrganic,
      "reviews": reviews.map((e) => e.toMap()).toList(),
      "saleingcount": saleingcount,
    };
  }
}
