import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram/models/content_model.dart';

class ContentsService {
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firestore;
  ContentsService(this._firebaseStorage, this._firestore);

  Future<List<ContentModel>> fetchContents() async {
    final contents = await _firestore.collection("contents").get();
    return contents.docs.map((e) => ContentModel.fromjson((e.data()))).toList();
  }

  Future<void> loadBinary(List<ContentModel> contentList) async {
    for (var e in contentList) {
      Reference directoryRef = _firebaseStorage.ref().child(e.contentPath);
      ListResult listResult = await directoryRef.list();

      for (Reference item in listResult.items) {
        String downloadURL = await item.getDownloadURL();
        e.contentUrl = downloadURL;
      }
    }
  }
}
