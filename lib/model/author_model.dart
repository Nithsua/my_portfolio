import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/services/firebase.dart';

class AuthorModel {
  final String publicName;
  final String subHead1;
  final String subHead2;
  final String intro;
  final String detailed;

  AuthorModel(
      {this.publicName,
      this.subHead1,
      this.subHead2,
      this.intro,
      this.detailed});
}

class AuthorService {
  Future<AuthorModel> getAuthorData() async {
    await FirebaseSevice.initFirebase();
    AuthorModel authorModel;
    QuerySnapshot snapshot = await firebaseSevice.getCollection("Author");
    QueryDocumentSnapshot documentSnapshot = snapshot.docs.first;
    authorModel = AuthorModel(
      publicName: documentSnapshot.get('PublicName'),
      subHead1: documentSnapshot.get('Subhead1'),
      subHead2: documentSnapshot.get('Subhead2'),
      intro: documentSnapshot.get('Intro'),
      detailed: documentSnapshot.get('Detailed'),
    );
    return authorModel;
  }
}

AuthorService _authorService = AuthorService();
AuthorModel authorModel;

Future<void> initAuthor() async {
  authorModel = await _authorService.getAuthorData();
}
