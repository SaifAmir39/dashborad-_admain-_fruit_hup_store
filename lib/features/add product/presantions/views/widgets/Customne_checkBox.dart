
import 'package:dash_bord_fruite_hup/core/utils/app_colors.dart';
import 'package:dash_bord_fruite_hup/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
class CustomneCheckbox extends StatelessWidget {
    final bool ischacked;
    final ValueChanged<bool>onchecked;
   CustomneCheckbox({super.key,required this.ischacked,required this.onchecked});

  @override
  Widget build(BuildContext context) {

     return GestureDetector(
      onTap: (){
       onchecked(
        !ischacked,
       
       
       );
        

      },
       child: AnimatedContainer(
         width: 24,
         height: 24,
         clipBehavior: Clip.antiAlias,
         duration: const Duration(milliseconds: 100), 
         decoration: ShapeDecoration(                 
           color:ischacked?AppColors.primaryColor: Colors.white,
           shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.5,
          color:ischacked?Colors.transparent: Color(0xFFDCDEDE),
        ),
        borderRadius: BorderRadius.circular(8),
           ),
         ),
         child:ischacked? SvgPicture.asset(Assets.imagesCheck)
         :null,
       ),
     );

    
  }
}