// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/widgets/Customne_checkBox.dart';
import 'package:flutter/material.dart';


class TermsAndconditions extends StatefulWidget {
final ValueChanged<bool> onchange;
  const TermsAndconditions({
    Key? key,
    required this.onchange,
  }) : super(key: key);
  @override
  State<TermsAndconditions> createState() => _TermsAndconditionsState();
}

class _TermsAndconditionsState extends State<TermsAndconditions> {
bool  isTermsAcppeted =false;

@override
  Widget build(BuildContext context) {
     return Row(
       children: [
        CustomneCheckbox( onchecked: (bool value) { 
          widget.onchange(value);
         setState(() {
           isTermsAcppeted =value;
         });
         

         }, ischacked: isTermsAcppeted, ),


       
      SizedBox(width: 16,),

         Column(
          children: [
            
                 Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'is Featured Item ?',
                        style: TextStyle(
                          color: const Color(0xFF949D9E) /* Grayscale-400 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          height: 1.70,
                        ),
                      ),
                     
                    ],
                  ),
                  textAlign: TextAlign.right,
                
              
            ),
          ],
             ),
       ],
     );
  }
}