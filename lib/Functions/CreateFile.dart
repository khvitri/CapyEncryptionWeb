import 'dart:convert';
import 'dart:html' as html;

void createFile(String name, String file) {
  final text = file;

  // prepare
  final bytes = utf8.encode(text);
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = '$name';
  html.document.body?.children.add(anchor);

// download
  anchor.click();

// cleanup
  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
