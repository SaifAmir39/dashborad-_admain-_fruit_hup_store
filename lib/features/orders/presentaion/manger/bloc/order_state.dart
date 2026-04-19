part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderSuccess extends OrderState {
  final List<OrderEntiti> orders;
  OrderSuccess({required this.orders});
}

class OrderError extends OrderState {
  final String message;
  OrderError({required this.message});
}