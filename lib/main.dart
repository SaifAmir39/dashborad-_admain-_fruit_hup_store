import 'package:dash_bord_fruite_hup/core/helper/on_generate_routes.dart';
import 'package:dash_bord_fruite_hup/core/services/get_it_service.dart';
import 'package:dash_bord_fruite_hup/features/dashboard/presentation/views/dashbord_viwe.dart';
import 'package:dash_bord_fruite_hup/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
    
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
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

