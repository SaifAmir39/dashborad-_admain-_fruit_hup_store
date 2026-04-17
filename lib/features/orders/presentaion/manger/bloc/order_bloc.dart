
import 'package:bloc/bloc.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_entiti.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepo orderRepo;

  
  OrderBloc({required this.orderRepo}) : super(OrderInitial()) {(

  on<GetOrderEvent>((event, emit)async {
   
  emit(OrderLoading());
   var reslut = await orderRepo.getOrders();
    reslut.fold(
    (failer) => emit(OrderError(message: failer.massage)),
    (order) => emit(OrderSuccess(orders: order)),
  
   );

  })
  
  );
 
}
}