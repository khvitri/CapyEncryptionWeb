import 'package:flutter/material.dart';
import 'package:flutter_webpage/DataStructures/text_files.dart';
import 'package:flutter_webpage/Firebase/ReadFireDoc.dart';
import 'package:provider/provider.dart';
import '../../DataStructures/FirebaseUser.dart';
import '../../Firebase/AuthFire.dart';
import '../Navbar/Navbar.dart';
import 'PullUpPage.dart';

class EncryptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
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
            StreamProvider<FirebaseUser?>.value(
                value: AuthService().user, initialData: null, child: Navbar()),
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
              padding: const EdgeInsets.only(top: 20.0, left: 40.0),
              child: MultiProvider(providers: [
                StreamProvider<FirebaseUser?>.value(
                  value: AuthService().user,
                  initialData: null,
                  catchError: (context, error) => null,
                ),
                StreamProvider<List<TextFiles>?>.value(
                  value: ReadFireDoc(user?.uid).firetextfiles,
                  initialData: null,
                  catchError: (context, error) => null,
                ),
              ], child: PullUpPage()),
            ),
          ],
        ),
      ),
    );
  }
}
