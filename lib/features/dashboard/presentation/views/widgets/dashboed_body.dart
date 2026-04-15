import 'package:dash_bord_fruite_hup/core/utils/Custome%20Bottun.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/add_%20products_viwe.dart';
import 'package:dash_bord_fruite_hup/features/orders/presentaion/view/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Positioned(
          
          child: 
        SvgPicture.asset("assets/images/freepik--Plant--inject-63.svg"),
        ),
      Positioned(child: 
      
         Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [

 SizedBox(height: 16,),
Text("Welcome back Admin",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
 SizedBox(height: 16,),
         Customebottun(
           
           onpressed: (){
           Navigator.pushNamed(context, AddproductsViwe.routeName);
         
         }, title:" Add Product",
                
                 
         ),
         SizedBox(height: 24,),
           Customebottun(
           
           onpressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context) => OrderView()));
         
         }, title:"View Orders",
                
                 
         ),

        
       ],
     ),
      
      
      ),
     Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: SvgPicture.asset("assets/images/freepik--Circles--inject-6.svg")),

     ]  
     
   
    );
  }
}