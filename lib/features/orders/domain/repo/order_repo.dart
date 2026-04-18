import 'package:dartz/dartz.dart';
import 'package:dash_bord_fruite_hup/core/errors/failer.dart';
import 'package:dash_bord_fruite_hup/features/orders/data/models/order_stutes.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_entiti.dart';

abstract class OrderRepo {
Future<Either<failer,void>> createOrder({required OrderEntiti order});

Stream<Either<failer,List<OrderEntiti>>> getOrders();

Future<Either<failer,void>> updateorderStatus({required OrderStutes status,required String orderid});
}