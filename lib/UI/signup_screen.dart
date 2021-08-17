import 'package:flutter/material.dart';
import 'package:forelsket/Components/error_handler.dart';
import 'package:forelsket/Services/authservice.dart';
import 'package:forelsket/Services/services.dart';
import 'package:forelsket/constants.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
          child: _buildSignupForm(),
        ),
      ),
    );
  }

  _buildSignupForm() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(height: 125.0),
          Container(
            height: size.height * 0.14,
            width: double.maxFinite,
            child: Stack(
              children: [
                Text(
                  'Signup',
                  style: TextStyle(fontFamily: 'Trueno', fontSize: 65.0),
                ),
                //Dot placement
                Positioned(
                  top: 62.0,
                  left: 200.0,
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
          SizedBox(height: 100.0),
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
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields())
                AuthService().signUp(email, password).then((userCreds) {
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
                    'SIGN UP',
                    style: TextStyle(color: Colors.white, fontFamily: 'Trueno'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Go back',
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
