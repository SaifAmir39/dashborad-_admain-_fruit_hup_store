import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dash_bord_fruite_hup/core/errors/failer.dart';

abstract class ImageRepo {

Future<Either<failer,String>> uploadImage({required File file});

}