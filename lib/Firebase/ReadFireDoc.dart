import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_webpage/DataStructures/text_files.dart';

class ReadFireDoc {
  String? uid;
  ReadFireDoc(this.uid); //Why does text files allow null but not this?

  List<TextFiles> _textFilesFromSnapShot(DocumentSnapshot snapshot) {
    List arrMap = snapshot.get("files");
    List<TextFiles> arrTextFiles = [];
    for (int i = 0; i < arrMap.length; i++) {
      int keyLength = arrMap[i].keys.toString().length;
      int valueLength = arrMap[i].values.toString().length;
      arrTextFiles.add(TextFiles(
          arrMap[i].keys.toString().substring(1, keyLength - 1),
          arrMap[i].values.toString().substring(1, valueLength - 1)));
    }
    return arrTextFiles;
  }

  //TO DO: Create a stream to read files
  Stream<List<TextFiles>?> get firetextfiles {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map(_textFilesFromSnapShot);
  }
}
