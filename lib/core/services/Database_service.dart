import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseService {

Future<void>AddData ( {required String path,required Map<String,dynamic>data,required String documentid});


Future<void>addData ( {required String path,required Map<String,dynamic>data});
Future<List<Map<String,dynamic>>>getalldata({required String path});
Future<Map<String,dynamic>> getdata({required String path,required String documentid});
Stream<List< Map<String,dynamic>>> getStreamdata({required String path});
Future<List<Map<String,dynamic>>> getspecificdata({
 required String path,

  Map<String, dynamic>? filters,
  String? orderBy,
  bool descending = false,
  int? limit,
  DocumentSnapshot? startAfter,

});
Future<bool > checkifdocumentexit({required String path,required String documentid});

}