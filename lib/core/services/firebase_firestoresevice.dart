import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_bord_fruite_hup/core/services/Database_service.dart';

class FirebaseFirestoresevice implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> AddData({
    required String path,
    required Map<String, dynamic> data,
    required String documentid,
  }) async {
    if (documentid != Null) {
      await firestore.collection(path).doc(documentid).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  @override
  Future<bool> checkifdocumentexit({
    required String path,
    required String documentid,
  }) async {
    var data = await firestore.collection(path).doc(documentid).get();

    return data.exists;
  }

  @override
  Future<List<Map<String, dynamic>>> getalldata({required String path}) async {
    var data = await firestore.collection(path).get();
    return data.docs.map((e) => e.data()).toList();
  }

  @override
  Future<Map<String, dynamic>> getdata({
    required String path,
    required String documentid,
  }) async {
    var data = await firestore.collection(path).doc(documentid).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<List<Map<String, dynamic>>> getspecificdata({
    required String path,

    Map<String, dynamic>? filters,
    String? orderBy,
    bool descending = false,
    int? limit,
    DocumentSnapshot? startAfter,
  }) async {
    Query collection = firestore.collection(path);

    /// 🔹 Filters (where)
    if (filters != null) {
      filters.forEach((key, value) {
        collection = collection.where(key, isEqualTo: value);
      });
    }

    /// 🔹 Sorting
    if (orderBy != null) {
      collection = collection.orderBy(orderBy, descending: descending);
    }

    /// 🔹 Pagination
    if (startAfter != null) {
      collection = collection.startAfterDocument(startAfter);
    }

    /// 🔹 Limit
    if (limit != null) {
      collection = collection.limit(limit);
    }

    var data = await collection.get();

    return data.docs.map((e) => e.data() as Map<String, dynamic>).toList();
  }

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Stream<List< Map<String, dynamic>>> getStreamdata({
    required String path,
    
  }) async* {
    var data = firestore.collection(path);
    await for (var snapshot in data.snapshots() ) {
      yield snapshot.docs.map((e) => e.data()).toList();
    }
  }
}
