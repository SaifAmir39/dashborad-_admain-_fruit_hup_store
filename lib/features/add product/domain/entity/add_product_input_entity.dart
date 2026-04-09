import 'dart:io';

import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/review_entity.dart';

class Addproductinputentity {
  String name;
  String price;
  String description;
  File image;
  String code;
  bool isFeatured;
   String? imageURL;
   bool isOrganic=false;
   int numberofcaliores;
   int unitaMount;
   int expirationsMountes;
   List<ReviewEntity> reviews;

  Addproductinputentity({

    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.code,
    required this.isFeatured,
    required this.numberofcaliores,
    required this.unitaMount,
    required this.expirationsMountes,
    required this.isOrganic,
    
   this.imageURL,
   required this.reviews,
  });
  
}
