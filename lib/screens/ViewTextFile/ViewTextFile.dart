import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webpage/DataStructures/text_files.dart';
import 'package:flutter_webpage/Functions/CreateFile.dart';
import 'package:flutter_webpage/Functions/Encrypt.dart';

class ViewTextFile extends StatefulWidget {
  final TextFiles textfirefiles;
  ViewTextFile(this.textfirefiles);

  @override
  State<ViewTextFile> createState() => _ViewTextFileState();
}

class _ViewTextFileState extends State<ViewTextFile> {
  final List<String> dlOptions = [
    "Download as Encrypted File",
    "Download as Decrytped File"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('${widget.textfirefiles.name}'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
                items: dlOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? option) {
                  if (option == "Download as Encrypted File") {
                    createFile(
                        widget.textfirefiles.name, widget.textfirefiles.file);
                  }
                  if (option == "Download as Decrytped File") {
                    createFile(widget.textfirefiles.name,
                        Encryption.decryptAES(widget.textfirefiles.file));
                  }
                },
                elevation: 0,
                icon: Icon(
                  Icons.file_download_outlined,
                ),
                underline: Container(
                  color: Colors.transparent,
                )),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // TO DO: Make sure that the file is scrollable
              return Container(
                width: constraints.biggest.width,
                height: constraints.biggest.height,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 35, right: 35),
                  child: Text('${widget.textfirefiles.file}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
