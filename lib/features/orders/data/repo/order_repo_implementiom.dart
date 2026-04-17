import 'package:dartz/dartz.dart';
import 'package:dash_bord_fruite_hup/core/errors/failer.dart';
import 'package:dash_bord_fruite_hup/core/services/Database_service.dart';
import 'package:dash_bord_fruite_hup/core/utils/backend_endpoint.dart';
import 'package:dash_bord_fruite_hup/features/orders/data/models/order_model.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_entiti.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/repo/order_repo.dart';


class OrderRepoImplementiom implements OrderRepo {
  
  final DatabaseService databaseService;

  OrderRepoImplementiom({required this.databaseService});
  
  @override
  Future<Either<failer, void>> createOrder({required OrderEntiti order})async {
     

    try{

     await databaseService.addData(path: BackendEndpoint.addOrder, 
     
     data: OrderModel.fromentitis(order).toJson(), );

   return Right(null);
    }
    catch(e){
      return Left(serverfailererror(e.toString()));
    }



    
  }
  
  @override
  Future<Either<failer, List<OrderEntiti>>> getOrders()async {
    try{
      var data= await databaseService.getalldata(path: "Orders");
      return Right(data.map((e) => OrderModel.fromjson(e).toEntiti()).toList());
    }
    catch(e){
       return Left(serverfailererror(e.toString()));
    }
   
  }
}