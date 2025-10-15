import 'dart:io';
import 'package:dash_bord_fruite_hup/core/services/storeg_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'as b;
class FireStorageService implements StoregService {
final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> UploadImage({required String path,required File file})async {
   String filename=b.basename(file.path);
   String fileexctations=b.extension(file.path);    
   final imagesref=storageRef.child("$path/$filename.$fileexctations");

   await  imagesref.putFile(file);
    
    var imageurl = imagesref.getDownloadURL();

    return imageurl.toString();
   

  }
}