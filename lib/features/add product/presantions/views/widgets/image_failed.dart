import 'package:dash_bord_fruite_hup/core/utils/app_colors.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/manger/image%20_picker/imagepicker_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

class ImageFailed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200,
        ),
      child: GestureDetector(
        onTap: (){
          BlocProvider.of<ImagepickerCubit>(context).pickimage();
        },
        child:
        
         Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade200,
          ),
          width: double.infinity,
          child: Center(
            child: BlocBuilder<ImagepickerCubit, ImagepickerState>(
              builder: (context, state) {
                
        
            if(state is Imagepickersucess){
            
             return Stack(
              children: [
             Image.file(
                    File(state.imagepicked!.path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),

                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(onPressed: (){
                      BlocProvider.of<ImagepickerCubit>(context).removeImage();
                     
                           
                    
                    }, icon: Icon(Icons.close,
                    color: Colors.red,)),
                  ), 
             ],
             );
             
             
        
        
              }
              else if(state is Imagepickerlodaing){
        
                return SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child:CircularProgressIndicator(
                      color: AppColors.primaryColor,
                      
                    ) ,
                          
                  ),
                );
              
               
              } 
              else{

                return Icon(Icons.image_outlined, size: 180);
              }
              }
            ),
          ),
        ),
      ),
      ),
    );
  }
}
