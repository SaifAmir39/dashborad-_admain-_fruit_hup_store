import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dash_bord_fruite_hup/core/errors/failer.dart';
import 'package:dash_bord_fruite_hup/core/repos/images_repo/image_repo.dart';
import 'package:dash_bord_fruite_hup/core/services/fire_storage_service.dart';

class ImageRepoImplemention implements ImageRepo {

FireStorageService fireStorageServicev;
  ImageRepoImplemention({required this.fireStorageServicev});
  @override
  Future<Either<failer, String>> uploadImage({required File file})async {
    try {

   String URL= await fireStorageServicev.UploadImage(path: "images", file: file);
    return Right(URL);
    }  

    catch (e) {

      return Left(serverfailererror("sorry something went wrong , filed to upload image"));

    }


  }
  
}