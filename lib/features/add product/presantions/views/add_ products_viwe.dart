import 'package:dash_bord_fruite_hup/core/utils/app_text_styles.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/manger/image%20_picker/imagepicker_cubit.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/widgets/add_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddproductsViwe extends StatelessWidget {
  static const String routeName = "addproductsViwe";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagepickerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Product",
            style: TextStyles.bold19.copyWith(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(child: AddProductBody()),
      ),

    );
  }
}
