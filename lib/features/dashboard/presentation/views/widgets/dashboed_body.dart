import 'package:dash_bord_fruite_hup/core/utils/Custome%20Bottun.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/add_%20products_viwe.dart';
import 'package:flutter/material.dart';

class DashboedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Center(child:
    Customebottun(
      
      onpressed: (){
      Navigator.pushNamed(context, AddproductsViwe.routeName);

    }, title:" Add Product",
           
            
    ),
     ),
    );
  }
}