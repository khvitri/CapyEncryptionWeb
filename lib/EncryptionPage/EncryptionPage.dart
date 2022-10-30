import 'package:flutter/material.dart';
import '../Navbar/Navbar.dart';
import 'PullUpPage.dart';

class EncryptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 95, 55, 2),
                Color.fromARGB(255, 58, 32, 2)
              ]),
        ),
        child: Column(
          children: <Widget>[
            Navbar(),
            Flexible(
                child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 95, 55, 2),
                      Color.fromARGB(255, 58, 32, 2)
                    ]),
              ),
            )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: PullUpPage(),
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
          ],
        ),
      ),
    );
  }
}
