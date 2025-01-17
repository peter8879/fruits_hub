
abstract class DataBaseService{
  Future<void> addData({required String path,required Map<String,dynamic> data,String? documentId});
  Future<dynamic> getData({ String? id,required String path,Map<String,dynamic>? query});
  Future<bool>ifDataExist({required String id,required String path});

}

