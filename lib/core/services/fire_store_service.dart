import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_base_service.dart';

class FireStoreService implements DataBaseService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data,String? documentId}) async{
    if(documentId!=null) {
      await firestore.collection(path).doc(documentId).set(data);
    }
    else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({ String? id, required String path,Map<String,dynamic>?query}) async{

    if(id!=null) {
      var data = await firestore.collection(path).doc(id).get();
      return data.data() as Map<String, dynamic>;
    }
    else
      {
        Query<Map<String, dynamic>> data =  firestore.collection(path);
        if(query!=null)
          {
            if(query['orderBy']!=null)
              {
                var orderByField=query['orderBy'];
                var descending=query['descending']??false;
                data=data.orderBy(orderByField,descending: descending);
              }
            if(query['limit']!=null)
              {
                var limit=query['limit'];
                data=data.limit(limit);
              }
          }
        var result=await data.get();
        return result.docs.map((e)=>e.data()).toList();
      }
  }

  @override
  Future<bool> ifDataExist({required String id, required String path}) async{
   var data=await firestore.collection(path).doc(id).get();
   return data.exists;
  }

  

}