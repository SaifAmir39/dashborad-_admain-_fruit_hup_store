part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}
class GetOrderEvent extends OrderEvent {}
class UpdateOrderEvent extends OrderEvent {
 final String orderId;
 final OrderStutes orderState;
  UpdateOrderEvent({required this.orderId,required this.orderState});
}