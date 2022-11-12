import 'package:flutter_webpage/Firebase/AuthFire.dart';
import 'package:flutter_webpage/Screens/AuthenticationPage/Login.dart';
import 'package:flutter_webpage/Screens/EncryptionPage/EncryptionPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DataStructures/FirebaseUser.dart';
import 'Loading/Loading.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser?>(
        stream: AuthService().user,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          if (snapshot.data != null) {
            return StreamProvider<FirebaseUser?>.value(
                value: AuthService().user,
                initialData: null,
                child: EncryptionPage());
          } else {
            return Login();
          }
        }));
  }
}
