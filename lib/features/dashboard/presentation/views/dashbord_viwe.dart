import 'package:dash_bord_fruite_hup/features/dashboard/presentation/views/widgets/dashboed_body.dart';
import 'package:flutter/material.dart';

class DashbordViwe extends StatelessWidget {
  static const String routeName = 'DashbordViwe';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1B5E37),
//         title: Text(
//   'Dashboard Admin',
//   textAlign: TextAlign.center,
//   style: TextStyle(
//     color: Colors.white,
//     fontSize: 24,
  
//     fontWeight: FontWeight.w700,
//   ),
// ),
//         centerTitle: true,
//       ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DashboedBody(),
      ),
    );
  }
}