import "package:file_picker/file_picker.dart";
import 'package:flutter_webpage/DataStructures/text_files.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Upload {
  //User selects their text file
  //TO DO: Check if it is a text file or not
  Future selectFile() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles();

    if (pickedFile == null) {
      return null;
    } else {
      List<int> fileInfo = pickedFile.files.first.bytes as List<int>;
      TextFiles fileData = TextFiles(
          pickedFile.files.first.name, String.fromCharCodes(fileInfo));
      return fileData;
    }
  }

  //User upload the encrypted text file to firebase
  // TO DO: Prevent uploading files with the same names
  Future uploadFile(String? uid, TextFiles encryptFile) async {
    final Map<String, String> data = {encryptFile.name: encryptFile.file};
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({
      'files': FieldValue.arrayUnion([data])
    });
  }
}
