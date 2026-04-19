part of 'updateorder_bloc.dart';

@immutable
abstract class UpdateorderEvent {}
class UpdateOrder extends UpdateorderEvent {
  final String orderId;
 final OrderStutes orderState;
  UpdateOrder({required this.orderId,required this.orderState});
}