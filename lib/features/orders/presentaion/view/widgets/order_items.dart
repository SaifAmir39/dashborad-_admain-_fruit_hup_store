import 'package:dash_bord_fruite_hup/features/orders/presentaion/view/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
 
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.6),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.white.withOpacity(0.3),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Total Pricer :",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
     SizedBox(height: 8,),
     Text("User ID :",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w400),),
     SizedBox(height: 8,),
      Text("Shapping Address :",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
     SizedBox(height: 8,),
     Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.black, size: 30,),
        Text("Shapping Address",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
      ],
     ),
     
     SizedBox(
       height: 16,
     ),
     Text("Payment Mathod :",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
    SizedBox(height: 8,),
    Row(
      children: [
        Icon(Icons.payment, color: Colors.black, size: 30,),
        SizedBox(width: 16,),
        Text("Payment Mathod",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
      ],
    ),

    SizedBox(
      height: 8,

    ),
    Divider(
      color: Colors.grey,
      thickness: 1,
    ),
    SizedBox(
      height: 8,
    ),
    Row(
  children: [
     Icon(Icons.list_alt, color: Colors.black, size: 30,),
     SizedBox(width: 16,),
      Text("Products :",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
 
  SizedBox(
  height: 8,
),
 

 
  ],
 ),
    
    ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
      
      return ProductItem();
    },itemCount: 5,),
    
    ],

  ),
);

   
  }
}