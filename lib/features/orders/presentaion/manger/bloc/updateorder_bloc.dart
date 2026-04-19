
import 'package:bloc/bloc.dart';
import 'package:dash_bord_fruite_hup/features/orders/data/models/order_stutes.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'updateorder_event.dart';
part 'updateorder_state.dart';

class UpdateorderBloc extends Bloc<UpdateorderEvent, UpdateorderState> {
  final OrderRepo orderRepo;
  UpdateorderBloc({required this.orderRepo}) : super(UpdateorderInitial()) {
   
    on<UpdateOrder>((event, emit) async {
       emit(UpdateorderLoading());
  var result = await orderRepo.updateorderStatus(
    status: event.orderState,
    orderid: event.orderId,
  );

  result.fold(
    (failer) => emit(UpdateorderError(message: failer.massage)),
    (_) => emit(UpdateorderSucess()),
  );
});
  }

  
}
