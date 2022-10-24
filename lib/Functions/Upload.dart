import "package:file_picker/file_picker.dart";
import 'package:flutter_webpage/DataStructures/text_files.dart';

class Upload {
  Future selectFile() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile == null) {
      return null;
    } else {
      TextFiles fileData =
          TextFiles(pickedFile.files.first.bytes, pickedFile.files.first.name);
      return fileData;
    }
  }
}
