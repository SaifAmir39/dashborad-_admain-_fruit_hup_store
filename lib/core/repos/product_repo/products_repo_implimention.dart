import 'package:dartz/dartz.dart';
import 'package:dash_bord_fruite_hup/core/errors/failer.dart';
import 'package:dash_bord_fruite_hup/core/repos/product_repo/products_repo.dart';
import 'package:dash_bord_fruite_hup/core/services/Database_service.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/data/models/Add_product_input_modles.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/add_product_input_entity.dart';

class ProductsRepoImplimention implements ProductsRepo {
  DatabaseService databaseService;

  ProductsRepoImplimention({required this.databaseService});
  @override
  Future<Either<failer,void>> addproducts(Addproductinputentity addproductinputentity)async {
   try{

     await databaseService.AddData(path: "Products",
      data: AddProductInputModles.fromentity(addproductinputentity).ToMap(), 
      documentid: addproductinputentity.code);
         return Right(null);

      
   }
   catch(e){
    return Left(serverfailererror(e.toString()));

   }
   



   }

   


  }
