import 'package:provider/provider.dart';
import '../screens/home/home.dart';
import 'package:flutter/material.dart';

import '../DataStructures/FirebaseUser.dart';
import 'package:flutter_webpage/screens/authenticate/Handler.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return Handler();
    } else {
      return Home();
    }
  }
}
