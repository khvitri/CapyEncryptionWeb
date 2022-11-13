import 'package:flutter/material.dart';
import 'package:flutter_webpage/DataStructures/text_files.dart';
import 'package:flutter_webpage/Functions/Encrypt.dart';
import 'package:flutter_webpage/Firebase/UploadToDoc.dart';
import 'package:flutter_webpage/Screens/Loading/Loading.dart';
import 'package:flutter_webpage/Screens/ViewTextFile/ViewTextFile.dart';
import 'package:provider/provider.dart';
import '../../DataStructures/FirebaseUser.dart';

class PullUpPage extends StatefulWidget {
  @override
  State<PullUpPage> createState() => _PullUpPageState();
}

class _PullUpPageState extends State<PullUpPage> {
  List<Widget> pageChildren(double width, double height, FirebaseUser? user,
      List<TextFiles>? textfirefiles, BuildContext context) {
    dynamic file;
    String? txt_to_str;
    TextFiles encrypted_file;
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 8,
                    color: Color.fromARGB(255, 24, 23, 23),
                    strokeAlign: StrokeAlign.outside,
                  )),
              height: 500,
              width: 500,
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.black),
                  itemCount: textfirefiles!.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      child: ListTile(
                          title: Text('${textfirefiles[index].name}'),
                          leading: Icon(Icons.file_present)),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ViewTextFile(textfirefiles[index])));
                      },
                    );
                  })),
            ),
            MaterialButton(
              color: Color.fromARGB(255, 19, 126, 38),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () async {
                file = await Upload().selectFile();
                if (file != null) {
                  txt_to_str = file.file;
                  encrypted_file = TextFiles(file.name,
                      Encryption.encryptAES(txt_to_str).base64 as String);
                  Upload().uploadFile(user!.uid, encrypted_file);
                  //TO DO: Save the key as a text file to their computer
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
    final textfirefiles = Provider.of<List<TextFiles>?>(context);
    if ((user != null) & (textfirefiles != null)) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageChildren(constraints.biggest.width / 2,
                  constraints.biggest.height, user, textfirefiles, context),
            );
          } else {
            return Column(
              children: pageChildren(constraints.biggest.width,
                  constraints.biggest.height, user, textfirefiles, context),
            );
          }
        },
      );
    } else {
      return Loading();
    }
  }
}
