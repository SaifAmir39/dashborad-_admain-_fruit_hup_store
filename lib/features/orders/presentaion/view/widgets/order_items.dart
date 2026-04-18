import 'package:dash_bord_fruite_hup/core/utils/app_colors.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_entiti.dart';
import 'package:dash_bord_fruite_hup/features/orders/presentaion/view/widgets/product_item.dart';
import 'package:flutter/material.dart';

class OrderItems extends StatelessWidget {
 final OrderEntiti orderEntiti;
 final   void Function() ?onAccept;
  final  void Function() ?onRefuse;
  
  OrderItems({Key? key,required this.orderEntiti,
  
  this.onAccept,
  this.onRefuse
  }) : super(key: key);
  
  getpymentmathoud(){
    if(orderEntiti.ispymentmethod==0){
      return "Cash";
    }
    else{
      return "Card";
    }
  }
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
      Row(
        children: [
          Text("Total Pricer :${orderEntiti.totalPrice!.round()}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
        Spacer(),
        Container(
          
  width: 80,
  height: 40,
  clipBehavior: Clip.antiAlias,
  decoration: ShapeDecoration(
    
    color: AppColors.secondaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    
  ),
  
        child: Center(
          child: Text(
          
            'panding',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
     
  ),

        
        
        ],

      ),
     SizedBox(height: 8,),
     Text("User ID :${orderEntiti.uiID}",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w400),),
     SizedBox(height: 8,),
    
     Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.black, size: 30,),
        Text("Shapping Address :\n ${orderEntiti.addressEntiti!.address}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
      ],
     ),
     
     SizedBox(
       height: 16,
     ),
     Text("Payment Mathod}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
    SizedBox(height: 8,),
    Row(
      children: [
        Icon(Icons.payment, color: Colors.black, size: 30,),
        SizedBox(width: 16,),
        Text("Payment Mathod : ${getpymentmathoud()}",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
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
      
      return ProductItem(product: orderEntiti.orderItems![index],);
    },itemCount: orderEntiti.orderItems!.length,),

    SizedBox(
      height: 8,
    ),
_buildActionButtons(),
    
    
    ],

    

  ),
);

   
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: _buildActionBtn(
              label: 'Accept',
              icon: Icons.check_circle_outline_rounded,
              color: const Color(0xFF2E7D32),
              bgColor: const Color(0xFFE8F5E9),
              onTap: onAccept ?? () {},
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildActionBtn(
              label: 'Refuse',
              icon: Icons.cancel_outlined,
              color: const Color(0xFFC62828),
              bgColor: const Color(0xFFFFEBEE),
              onTap: onRefuse ?? () {},
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildActionBtn({
    required String label,
    required IconData icon,
    required Color color,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}