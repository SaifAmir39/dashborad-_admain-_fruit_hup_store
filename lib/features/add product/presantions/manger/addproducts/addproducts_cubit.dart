import 'package:dash_bord_fruite_hup/core/repos/images_repo/image_repo_implemention.dart';
import 'package:dash_bord_fruite_hup/core/repos/product_repo/products_repo_implimention.dart';
import 'package:dash_bord_fruite_hup/core/services/Database_service.dart';
import 'package:dash_bord_fruite_hup/core/services/fire_storage_service.dart';
import 'package:dash_bord_fruite_hup/core/services/get_it_service.dart';
import 'package:dash_bord_fruite_hup/features/add%20product/domain/entity/add_product_input_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'addproducts_state.dart';

class AddproductsCubit extends Cubit<AddproductsState> {
  AddproductsCubit() : super(AddproductsInitial());
  Future<void> Addproduct(Addproductinputentity addproductinputentity) async {
    emit(AddproductsLoading());

    var reslut = await ImageRepoImplemention(
      fireStorageServicev:getIt.get<FireStorageService>(),
    ).uploadImage(file: addproductinputentity.image);
    reslut.fold(
      (failer) => emit(AddproductsFailer(errormassage: failer.massage)),
      (url) async {
        addproductinputentity.imageURL = url;
        var reslut = await ProductsRepoImplimention(
          databaseService:getIt.get<DatabaseService>()).addproducts(
          addproductinputentity,
        );

        reslut.fold(
          (failer) => emit(AddproductsFailer(errormassage: failer.massage)),
          (r) => emit(AddproductsSuccess()),
        );
      },
    );
  }
}
