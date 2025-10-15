

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_bord_fruite_hup/core/services/Database_service.dart';

class FirebaseFirestoresevice implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> AddData({
    required String path,
    required Map<String, dynamic> data,
    required String documentid
  }) async {

    if(documentid != Null
   ){
        await firestore.collection(path).doc(documentid).set(data); 
    }


     else{
       await firestore.collection(path).add(data);
      
    }
    
   
  }

  @override
  Future<Map<String,dynamic>> getdata({required String path, required String id, })async {

  var data= await firestore.collection(path).doc(id).get();

  return data.data() as Map<String,dynamic>;

  }
  
  @override
  Future<bool> checkifdocumentexit({required String path, required String documentid})async {
    
  var data=await firestore.collection(path).doc(documentid).get();

  return data.exists;
    
  }
  
 
  
}
 

