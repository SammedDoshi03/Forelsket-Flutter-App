import 'package:flutter/material.dart';
import 'package:forelsket/Components/error_handler.dart';
import 'package:forelsket/Components/reset.dart';
import 'package:forelsket/Services/authservice.dart';
import 'package:forelsket/Services/services.dart';
import 'package:forelsket/UI/signup_screen.dart';
import 'package:forelsket/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  late String email, password;

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  _buildLoginForm() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(height: 125.0),
          Container(
            height: size.height * 0.25,
            width: double.maxFinite,
            child: Stack(
              children: [
                Text(
                  'Hello',
                  style: TextStyle(fontFamily: 'Trueno', fontSize: 65.0),
                ),
                Positioned(
                  top: 50.0,
                  child: Text(
                    'There',
                    style: TextStyle(fontFamily: 'Trueno', fontSize: 65.0),
                  ),
                ),
                Positioned(
                  top: 97.0,
                  left: 175.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: greenColor),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                    fontFamily: 'Trueno',
                    fontSize: 12.0,
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greenColor),
                ),
              ),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Email is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'PASSWORD',
                labelStyle: TextStyle(
                    fontFamily: 'Trueno',
                    fontSize: 12.0,
                    color: Colors.grey.withOpacity(0.5)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greenColor),
                ),
              ),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null),
          SizedBox(height: 5.0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResetPassword(),
                ),
              );
            },
            child: Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: greenColor,
                      fontFamily: 'Trueno',
                      fontSize: 11.0,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields())
                AuthService()
                    .signIn(email, password, context)
                    .then((userCreds) {
                  Navigator.of(context).pop();
                }).catchError(
                  (e) {
                    ErrorHandler().errorDialog(context, e);
                  },
                );
            },
            child: Container(
              height: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(25.0),
                shadowColor: Colors.greenAccent,
                color: greenColor,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontFamily: 'Trueno'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              AuthService().signInwithGoogle().then((userCreds) {
                Navigator.of(context).pop();
              }).catchError(
                (e) {
                  ErrorHandler().errorDialog(context, e);
                },
              );
            },
            child: Container(
              height: 50.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: ImageIcon(AssetImage('assets/google.png'),
                            size: 15.0)),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text(
                        'Login with Google',
                        style: TextStyle(fontFamily: 'Trueno'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              AuthService().fbSignIn().then((userCreds) {
                Navigator.of(context).pop();
              }).catchError(
                (e) {
                  ErrorHandler().errorDialog(context, e);
                },
              );
            },
            child: Container(
              height: 50.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: ImageIcon(AssetImage('assets/facebook.png'),
                            size: 15.0)),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text(
                        'Login with Facebook',
                        style: TextStyle(fontFamily: 'Trueno'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New to Forelsket ?'),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: greenColor,
                      fontFamily: 'Trueno',
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
