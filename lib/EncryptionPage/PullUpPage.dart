import 'package:flutter/material.dart';
import 'package:flutter_webpage/Functions/Upload.dart';

class PullUpPage extends StatefulWidget {
  @override
  State<PullUpPage> createState() => _PullUpPageState();
}

class _PullUpPageState extends State<PullUpPage> {
  dynamic file;

  List<Widget> pageChildren(double width, BuildContext context) {
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
                  onPressed: () {
                    setState(() async {
                      file = await Upload().selectFile();
                    });
                  },
                  child: Text(
                    "Pull Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]))
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
