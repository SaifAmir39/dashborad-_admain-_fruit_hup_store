part of 'addproducts_cubit.dart';

abstract class AddproductsState {}

class AddproductsInitial extends AddproductsState {}
class AddproductsLoading extends AddproductsState {}
class AddproductsSuccess extends AddproductsState {}
class AddproductsFailer extends AddproductsState {
final String errormassage;
AddproductsFailer({required this.errormassage});

}



