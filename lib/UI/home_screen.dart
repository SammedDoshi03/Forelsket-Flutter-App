import 'package:flutter/material.dart';
import 'package:forelsket/UI/login_screen.dart';
import 'package:forelsket/UI/signup_screen.dart';
import 'package:forelsket/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = new GlobalKey<FormState>();

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
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
      ),
      child: ListView(
        children: [
          SizedBox(height: size.height * 0.1),
          Container(
            height: size.height * 0.15,
            width: double.maxFinite,
            child: Stack(
              children: [
                Text(
                  '',
                  style: TextStyle(fontFamily: 'Trueno', fontSize: 65.0),
                ),
                Positioned(
                  top: 50.0,
                  child: Text(
                    'Welcome',
                    style: TextStyle(fontFamily: 'Trueno', fontSize: 65.0),
                  ),
                ),
                Positioned(
                  top: 97.0,
                  left: size.width * 0.67,
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
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/gif/gif.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.10),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
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
                      'Get Started',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Trueno'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Feeling of Falling in Love',
                style: TextStyle(
                    color: greenColor,
                    fontFamily: 'Trueno',
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
