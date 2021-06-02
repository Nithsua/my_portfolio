import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseSevice {
  static Future<FirebaseApp> initFirebase() {
    return Firebase.initializeApp();
  }

  Future<QuerySnapshot> getCollection(String collectionId) async {
    CollectionReference colRef =
        FirebaseFirestore.instance.collection(collectionId);

    return colRef.get();
  }
}

FirebaseSevice firebaseSevice = FirebaseSevice();
