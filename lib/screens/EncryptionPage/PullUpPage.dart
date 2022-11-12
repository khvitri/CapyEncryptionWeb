import 'package:flutter/material.dart';
import 'package:flutter_webpage/DataStructures/text_files.dart';
import 'package:flutter_webpage/Functions/Encrypt.dart';
import 'package:flutter_webpage/Firebase/UploadToDoc.dart';
import 'package:provider/provider.dart';
import '../../DataStructures/FirebaseUser.dart';

class PullUpPage extends StatefulWidget {
  @override
  State<PullUpPage> createState() => _PullUpPageState();
}

class _PullUpPageState extends State<PullUpPage> {
  List<Widget> pageChildren(
      double width, double height, FirebaseUser? user, BuildContext context) {
    dynamic file;
    String? txt_to_str;
    TextFiles encrypted_file;
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Color.fromARGB(255, 19, 126, 38),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () async {
                file = await Upload().selectFile();
                if (file != null) {
                  // There might be an error with uploading a new text file after the previous one
                  txt_to_str = file.file;
                  encrypted_file = TextFiles(file.name,
                      Encryption.encryptAES(txt_to_str).base64 as String);
                  //TODO: Upload encrypted_str to firebase
                  Upload().uploadFile(user!.uid, encrypted_file);
                  //TODO: Save the key as a text file to their computer jew
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text("Upload Here",
                    style: TextStyle(fontSize: 16.0, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 100, right: 60),
        child: Image.asset(
          "assets/images/llp_image.png",
          width: width * 0.5,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2,
                constraints.biggest.height, user, context),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width,
                constraints.biggest.height, user, context),
          );
        }
      },
    );
  }
}
