import 'package:flutter/material.dart';
import 'package:flutter_webpage/Screens/LandingPage/LandingPage.dart';
import 'package:flutter_webpage/Screens/Navbar/Navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_webpage/screens/AuthenticationPage/Login.dart';
import 'package:flutter_webpage/screens/AuthenticationPage/Registar.dart';
import 'package:flutter_webpage/screens/EncryptionPage/EncryptionPage.dart';
import 'package:provider/provider.dart';
import 'DataStructures/FirebaseUser.dart';
import 'Firebase/AuthFire.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAxjtj6jF6l4aeGTqxKBuEATzRrzvJF8gI",
          authDomain: "encryption-web.firebaseapp.com",
          projectId: "encryption-web",
          storageBucket: "encryption-web.appspot.com",
          messagingSenderId: "30830924936",
          appId: "1:30830924936:web:d65b911203d010f7e5bb3d"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capy Certified Encrypter',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Revamped"),
      home: MyHomePage(),
      routes: {
        '/log_in': (context) => Login(),
        '/register': (context) => Register(),
        '/encryption': (context) => EncryptionPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 95, 55, 2),
                Color.fromARGB(255, 58, 32, 2)
              ]),
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                children: <Widget>[
                  StreamProvider<FirebaseUser?>.value(
                      value: AuthService().user,
                      initialData: null,
                      child: Navbar()),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 80.0, left: 80.0),
                    child: LandingPage(constraints: constraints),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
