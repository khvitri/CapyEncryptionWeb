import 'package:flutter_test/flutter_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_webpage/Functions/Upload.dart';

void main() {
  test('Select file check', () {
    final result = Upload().selectFile();
  });
}
