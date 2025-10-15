

abstract class DatabaseService {

Future<void>AddData ( {required String path,required Map<String,dynamic>data,required String documentid});
Future<Map<String,dynamic>> getdata({required String path,required String id});
Future<bool > checkifdocumentexit({required String path,required String documentid});

}