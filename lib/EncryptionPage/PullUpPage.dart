import 'package:flutter/material.dart';
import 'package:flutter_webpage/Functions/Encrypt.dart';
import 'package:flutter_webpage/Functions/Upload.dart';

class PullUpPage extends StatefulWidget {
  @override
  State<PullUpPage> createState() => _PullUpPageState();
}

class _PullUpPageState extends State<PullUpPage> {
  List<Widget> pageChildren(double width, BuildContext context) {
    dynamic file;
    String? txt_to_str;
    late var encrypted_str;
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MaterialButton(
              color: Color.fromARGB(255, 19, 126, 38),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () async {
                file = await Upload().selectFile();
                if (file != null) {
                  txt_to_str = String.fromCharCodes(file.file);
                  encrypted_str = Encryption.encryptAES(txt_to_str);
                  //TODO: Upload encrypted_str to firebase
                  //TODO: Save the key as a text file to their computer
                }
                setState(() async {});
              },
              child: Text(
                "Upload Here",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(
          "assets/images/llp_image.png",
          width: width,
        ),
      ),
      Flexible(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 95, 55, 2),
                Color.fromARGB(255, 58, 32, 2)
              ]),
        ),
      ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2, context),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }
}

