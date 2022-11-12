import 'package:flutter/material.dart';
import 'package:flutter_webpage/Screens/Redirect.dart';

class LandingPage extends StatelessWidget {
  final BoxConstraints? constraints;
  LandingPage({this.constraints});

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 70, right: 30, left: 30, bottom: 30),
        child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  // borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 8,
                    color: Color.fromARGB(255, 24, 23, 23),
                    strokeAlign: StrokeAlign.outside,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(251, 20, 23, 21),
                      offset: const Offset(
                        15.0,
                        15.0,
                      ),
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
        child: Image.asset(
          "assets/images/lp_image.png",
          //width: width * 0.7,
          fit: BoxFit.cover,
        ),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wrapper()),
                );
              },
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40),
                  child: Text(
                    "Encrypt Now!",
                    style: TextStyle(color: Colors.white),
                  ),
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
