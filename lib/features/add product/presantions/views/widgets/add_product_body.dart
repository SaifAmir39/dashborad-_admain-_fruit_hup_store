import 'dart:io';
import 'package:dash_bord_fruite_hup/core/utils/Custome%20Bottun.dart';
import 'package:dash_bord_fruite_hup/core/utils/custome%20_txet_form_failed.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/add_product_input_entity.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/manger/addproducts/addproducts_cubit.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/widgets/Terms%20_and_%20Conditions.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/widgets/image_failed.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/presantions/views/widgets/is_orginc_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductBody extends StatefulWidget {
  AddProductBody({Key? key}) : super(key: key);

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  final TextEditingController textEditingControllername =
      TextEditingController();

  final TextEditingController textEditingControllerprice =
      TextEditingController();

  final TextEditingController textEditingControllercode =
      TextEditingController();

  final TextEditingController textEditingControllerdescription =
      TextEditingController();

  final TextEditingController textEditingControllernumberOfCalories =
      TextEditingController();
  final TextEditingController textEditingControllerunitAmount =
      TextEditingController();
  final TextEditingController textEditingControllerexpirationMountes =
      TextEditingController();

  final TextEditingController textEditingControllerexpirationYears =
      TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? fileimage;
  bool isfeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<AddproductsCubit, AddproductsState>(
              listener: (context, state) {
                if (state is AddproductsFailer) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errormassage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AddproductsSuccess ||
                    state is AddproductsInitial) {
                  return Column(
                    children: [
                      SizedBox(height: 16),
                      CustomeTxetFormFailed(
                        maxLines: 1,
                        title: "Product Name",
                        textInputType: TextInputType.text,
                        textEditingController: textEditingControllername,
                      ),
                      SizedBox(height: 16),
                      CustomeTxetFormFailed(
                        maxLines: 1,
                        title: "Product Price",
                        textInputType: TextInputType.text,
                        textEditingController: textEditingControllerprice,
                      ),

                      SizedBox(height: 16),
                      CustomeTxetFormFailed(
                        maxLines: 1,
                        title: "Product Code",
                        textInputType: TextInputType.text,
                        textEditingController: textEditingControllercode,
                      ),

                      SizedBox(height: 16),
                      CustomeTxetFormFailed(
                        maxLines: 5,
                        title: "Product  Description",
                        textInputType: TextInputType.text,
                        textEditingController: textEditingControllerdescription,
                      ),

                      SizedBox(height: 16),
                      CustomeTxetFormFailed(
                        maxLines: 1,
                        title: "numberofcaliores",
                        textInputType: TextInputType.number,
                        textEditingController:
                            textEditingControllernumberOfCalories,
                      ),
                      SizedBox(height: 16),
                      CustomeTxetFormFailed(
                        maxLines: 1,
                        title: "unitaMount",
                        textInputType: TextInputType.number,
                        textEditingController: textEditingControllerunitAmount,
                      ),
                      SizedBox(height: 16),
                      CustomeTxetFormFailed(
                        maxLines: 1,
                        title: "expirationsMountes",
                        textInputType: TextInputType.number,
                        textEditingController:
                            textEditingControllerexpirationMountes,
                      ),

                      SizedBox(height: 16),
                      TermsAndconditions(
                        onchange: (bool isTermsAcppeted) {
                          setState(() {
                            isfeatured = isTermsAcppeted;
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      IsOrganicCheck(
                        onchange: (bool isOrganic) {
                          setState(() {
                            isOrganic = isOrganic;
                          });
                        },
                      ),

                      SizedBox(height: 28),
                      ImageFailed(
                        onfilechsnges: (imagepicked) {
                          setState(() {
                            fileimage = imagepicked;
                          });
                        },
                      ),
                      SizedBox(height: 28),
                      Customebottun(
                        onpressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            Addproductinputentity input = Addproductinputentity(
  name: textEditingControllername.text,
  price: textEditingControllerprice.text,
  description: textEditingControllerdescription.text,
  image: fileimage!,
  code: textEditingControllercode.text,
  isFeatured: isfeatured,
  numberofcaliores: int.tryParse(textEditingControllernumberOfCalories.text) ?? 0,
  unitaMount: int.tryParse(textEditingControllerunitAmount.text) ?? 0,
  expirationsMountes: int.tryParse(textEditingControllerexpirationMountes.text) ?? 0,
  isOrganic: isOrganic, reviews: [],
);

                            BlocProvider.of<AddproductsCubit>(
                              context,
                            ).Addproduct(input);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("All fields are required"),
                              ),
                            );
                          }
                        },
                        title: " Add Product",
                      ),
                    ],
                  );
                } else if (state is AddproductsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    height: 200,
                    child: Center(child: Text("Something went wrong")),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
