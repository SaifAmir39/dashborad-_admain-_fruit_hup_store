import 'package:dash_bord_fruite_hup/features/orders/presentaion/view/widgets/order_items.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 24,)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                
              Icon(Icons.note_alt_outlined, color: Colors.black, size: 30,),
              SizedBox(width: 16,),
                Text("Total Orders :",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
            ]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
       SliverList.builder(
        
        
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 8),
          child: OrderItems(),
        ), itemCount: 2),

        ],
      ),
    );
  }
}