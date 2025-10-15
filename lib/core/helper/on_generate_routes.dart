
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/add_%20products_viwe.dart';
import 'package:dash_bord_fruite_hup/features/dashboard/presentation/views/dashbord_viwe.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    
    case DashbordViwe.routeName:
    return MaterialPageRoute(builder: (context)=>  DashbordViwe());

    case AddproductsViwe.routeName:
    return MaterialPageRoute(builder: (context)=> AddproductsViwe());
      
   default:
   return MaterialPageRoute(builder: (context)=>  Scaffold());
  }
  
  
  }