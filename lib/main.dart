import 'package:dash_bord_fruite_hup/core/helper/on_generate_routes.dart';
import 'package:dash_bord_fruite_hup/core/services/get_it_service.dart';
import 'package:dash_bord_fruite_hup/features/dashboard/presentation/views/dashbord_viwe.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
    setup();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});
  
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
     onGenerateRoute: onGenerateRoute,
     initialRoute: DashbordViwe.routeName,
     
    );
  }
}

