import 'package:dash_bord_fruite_hup/features/orders/presentaion/view/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            size: 30,
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xFF1B5E37),
         title: Text(
   'Orders',
   textAlign: TextAlign.center,
   style: TextStyle(
    color: Colors.white,
     fontSize: 24,
  
     fontWeight: FontWeight.w700,
   ),
),
        centerTitle: true,
      ),
      body: OrdersViewBody(),
    );
    
  }
} 