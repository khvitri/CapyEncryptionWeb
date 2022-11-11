import 'package:flutter/material.dart';
import 'package:flutter_webpage/EncryptionPage/EncryptionPage.dart';

class LandingPage extends StatelessWidget {
  final BoxConstraints? constraints;
  LandingPage({this.constraints});

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 50),
        child: Image.asset(
          "assets/images/lp_image.png",
          width: width * 0.7,
        ),
      ),
      Container(
        width: width,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Capybara Certified \nEncryption",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "The Capybara community has deemed this online encryter worthy of 'ok i pull up'.",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Color.fromARGB(255, 19, 126, 38),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EncryptionPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text(
                  "Encrypt Now!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (constraints!.maxWidth > 1500) {
      return Row(
        children: pageChildren(constraints!.biggest.width / 2, context),
      );
    } else {
      return Column(
        children: pageChildren(constraints!.biggest.width / 2, context),
      );
    }
  }
}
