import 'package:flutter/material.dart';
import 'package:flutter_webpage/Functions/Encrypt.dart';
import 'package:flutter_webpage/Functions/Upload.dart';

class PullUpPage extends StatefulWidget {
  @override
  State<PullUpPage> createState() => _PullUpPageState();
}

class _PullUpPageState extends State<PullUpPage> {
  List<Widget> pageChildren(double width, double height, BuildContext context) {
    dynamic file;
    String? txt_to_str;
    late var encrypted_str;
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
                  txt_to_str = String.fromCharCodes(file.file);
                  encrypted_str = Encryption.encryptAES(txt_to_str);
                  //TODO: Upload encrypted_str to firebase
                  //TODO: Save the key as a text file to their computer jew
                }
                setState(() async {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 50.0),
                child: Text("Upload Here",
                    style: TextStyle(fontSize: 16.0, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 100,
          right: 40,
          left: 5,
        ),
        child: Image.asset(
          "assets/images/llp_image.png",
          width: width * 0.8,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2,
                constraints.biggest.height, context),
          );
        } else {
          return Column(
            children: pageChildren(
                constraints.biggest.width, constraints.biggest.height, context),
          );
        }
      },
    );
  }
}
