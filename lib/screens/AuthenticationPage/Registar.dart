import 'package:flutter_webpage/DataStructures/loginuser.dart';
import 'package:flutter_webpage/Screens/AuthenticationPage/Login.dart';
import 'package:flutter_webpage/Firebase/AuthFire.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  final AuthService _auth = new AuthService();

  bool _obscureText = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        controller: _email,
        autofocus: false,
        validator: (value) {
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Enter a Valid Email Address';
          }
        },
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(225, 4, 225, 12))),
            hoverColor: Color.fromARGB(255, 4, 255, 12),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "e.g. kapibarasan1234!",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));

    final passwordField = TextFormField(
        obscureText: _obscureText,
        controller: _password,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if (value.trim().length < 8) {
            return 'Password must be at least 8 characters in length';
          }
          // Return null if the entered password is valid
          return null;
        },
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(225, 4, 225, 12))),
            hoverColor: Color.fromARGB(255, 4, 255, 12),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "e.g. kapibarasan1234!",
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))));

    final txtbutton = TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: const Text(
          'Go login our new capyfriend!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ));

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Color.fromARGB(255, 19, 126, 38),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            dynamic result = await _auth.registerEmailPassword(
                LoginUser(email: _email.text, password: _password.text));
            if (result.uid == null) {
              //null means unsuccessfull authentication
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(result.code),
                    );
                  });
            }
          }
        },
        child: Text(
          "Join the Tribe",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    //GUI here
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 94, 31),
        title: const Text(
          'Cyberbara Encryption',
          style: TextStyle(
              fontFamily: 'glitched',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30),
        ),
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
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
                  "assets/images/pl_gif.gif",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 45.0),
                    emailField,
                    const SizedBox(height: 25.0),
                    passwordField,
                    const SizedBox(height: 25.0),
                    txtbutton,
                    const SizedBox(height: 35.0),
                    registerButton,
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
