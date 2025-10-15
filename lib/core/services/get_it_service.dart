import 'package:dash_bord_fruite_hup/core/repos/images_repo/image_repo.dart';
import 'package:dash_bord_fruite_hup/core/repos/images_repo/image_repo_implemention.dart';
import 'package:dash_bord_fruite_hup/core/repos/product_repo/products_repo.dart';
import 'package:dash_bord_fruite_hup/core/repos/product_repo/products_repo_implimention.dart';
import 'package:dash_bord_fruite_hup/core/services/Database_service.dart';
import 'package:dash_bord_fruite_hup/core/services/fire_storage_service.dart';
import 'package:dash_bord_fruite_hup/core/services/firebase_firestoresevice.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;

void setup() {
 getIt.registerSingleton<DatabaseService>(FirebaseFirestoresevice());
 getIt.registerSingleton<FireStorageService>(
 FireStorageService(),
 );
 getIt.registerSingleton<ImageRepo>(
ImageRepoImplemention(fireStorageServicev: getIt.get<FireStorageService>()),

 );
getIt.registerSingleton<ProductsRepo>(

ProductsRepoImplimention(databaseService:getIt.get<DatabaseService>(),
),
);

 
}
