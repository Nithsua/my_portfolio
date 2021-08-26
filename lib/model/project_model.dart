import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/services/firebase.dart';

class ProjectModel {
  final String name;
  final String description;
  final String gitLink;

  ProjectModel(
      {required this.name, required this.description, required this.gitLink});
}

class ProjectService {
  Future<List<ProjectModel>> getProjects() async {
    await FirebaseSevice.initFirebase();
    List<ProjectModel> projectModels = [];
    QuerySnapshot snapshot = await firebaseSevice.getCollection("Projects");
    List<QueryDocumentSnapshot> documentSnapshot = snapshot.docs;
    for (int i = 0; i < documentSnapshot.length; i++) {
      QueryDocumentSnapshot snapshot = documentSnapshot.elementAt(i);
      projectModels.add(ProjectModel(
        name: snapshot.get('Title'),
        description: snapshot.get('Description'),
        gitLink: snapshot.get('Gitlink'),
      ));
    }
    return projectModels;
  }
}

ProjectService projectService = ProjectService();
