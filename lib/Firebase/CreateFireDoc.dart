import 'package:cloud_firestore/cloud_firestore.dart';

class CreateFireDoc {
  String uid;
  CreateFireDoc(this.uid);

  Future createUserData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'files': []});
  }
}
