
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/address_entiti.dart';

class ShaipingAddresModle {
  
  String ? name;
  String? email;
  String? address;
  String? city;
  String?numberofapartment;

  ShaipingAddresModle({this.name,this.email,this.address,this.city,this.numberofapartment});

toentites (){
  return AddressEntiti(
    name: name,
    email: email,
    address: address,
    city: city,
    numberofapartment: numberofapartment
  );
}


factory ShaipingAddresModle.fromjson(Map<String,dynamic>json){
  return ShaipingAddresModle(
    name: json['name'] as String?,
    email: json['email'] as String?,
    address: json['address'] as String?,
    city: json['city'] as String?,
    numberofapartment: json['numberofapartment'] as String?
  );
}


factory ShaipingAddresModle.fromentitis(AddressEntiti addressEntiti){
  return ShaipingAddresModle(
    name: addressEntiti.name ?? "",
    email: addressEntiti.email ?? "",
    address: addressEntiti.address ?? "",
    city: addressEntiti.city ?? "",
    numberofapartment: addressEntiti.numberofapartment ?? ""
  );
}

 tojson(){
  return{
    'name':name,
    'email':email,
    'address':address,
    'city':city,
    'numberofapartment':numberofapartment,
  };
}

}