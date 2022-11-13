import 'package:flutter/material.dart';
import 'package:flutter_webpage/DataStructures/FirebaseUser.dart';
import 'package:flutter_webpage/Firebase/AuthFire.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Cyberbara Encryption",
              style: TextStyle(shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 7, 7, 7),
                ),
              ], fontFamily: 'Glitched', color: Colors.white, fontSize: 30),
            ),
            Row(
              children: <Widget>[
                Text(
                  "Home",
                  style: TextStyle(shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 7, 7, 7),
                ),
              ], 
                    color: Colors.white, fontFamily: 'Revamped', fontSize: 10),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "About Us",
                  style: TextStyle(shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 7, 7, 7),
                ),
              ], 
                    color: Colors.white, fontFamily: 'Revamped', fontSize: 10),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "About Mr.Capy",
                  style: TextStyle(shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 7, 7, 7),
                ),
              ], 
                    color: Colors.white, fontFamily: 'Revamped', fontSize: 10),
                ),
                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  
                  color: Color.fromARGB(255, 19, 126, 38),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () async {
                    if (user == null) {
                      Navigator.pushNamed(context, '/log_in');
                    } else {
                      await AuthService().signOut();
                      if (ModalRoute.of(context)?.settings.name != "/") {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text(
                    user == null ? "Login/Regsiter" : "Logout",
                    style: TextStyle(color: Colors.white, fontFamily: 'Revamped', fontSize: 10),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      child: Container(
        child: Column(children: <Widget>[
          Text(
            "Cyberbara Encryption",
            style: TextStyle(shadows: <Shadow>[
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 5.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(10.0, 10.0),
                blurRadius: 8.0,
                color: Color.fromARGB(124, 7, 7, 7),
              ),
            ], fontFamily: 'Glitched', color: Colors.white, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Home",
                  style: TextStyle(
                    shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 7, 7, 7),
                ),
              ], color: Colors.white, fontFamily: 'Revamped', ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "About Us",
                  style: TextStyle(shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 7, 7, 7),
                ),
              ], 
                    color: Colors.white, fontFamily: 'Revamped'),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "About Mr.Capy",
                  style: TextStyle(shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 7, 7, 7),
                ),
              ], 
                    color: Colors.white, fontFamily: 'Revamped'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
