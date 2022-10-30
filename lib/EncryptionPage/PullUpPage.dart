import 'package:flutter/material.dart';
import 'package:flutter_webpage/Functions/Upload.dart';
import 'package:path/path.dart';

class PullUpPage extends StatefulWidget {
  @override
  State<PullUpPage> createState() => _PullUpPageState();
}

class _PullUpPageState extends State<PullUpPage> {
  dynamic file;

  List<Widget> pageChildren(
      double width, BuildContext context, String fileName) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                //Add LinearGradient, ClickAnimation, ShadowBox
                color: Color.fromARGB(255, 19, 126, 38),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  setState(() async {
                    file = await Upload().selectFile();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 100.0, horizontal: 290.0),
                  child: Text(
                    "Upload Here",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
              ),
              Text(fileName),
            ]),
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
    String fileName = file != null ? basename(file!.path) : '';
    print(file);
    print(fileName);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                pageChildren(constraints.biggest.width / 2, context, fileName),
          );
        } else {
          return Column(
            children:
                pageChildren(constraints.biggest.width, context, fileName),
          );
        }
      },
    );
  }
}
