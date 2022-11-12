import 'package:flutter_webpage/Screens/AuthenticationPage/Login.dart';
import 'package:flutter_webpage/Screens/EncryptionPage/EncryptionPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../DataStructures/FirebaseUser.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    print(user);
    if (user == null) {
      return Login();
    } else {
      return EncryptionPage();
    }
  }
}
