import 'package:b4together/page/learnings/learning_Page.dart';
import 'package:b4together/page/user1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // SizedBox(height: 10.0),
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black12,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              hintText: 'Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          width: 250,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShowPasswordCheckbox() {
    return Container(
      // alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 25,
          ),
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Show Password',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: 250,
      child: RaisedButton(
        elevation: 1.0,
        onPressed: () {
          print('Login Button Pressed');
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) {
              return User();
            },
          ));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        // color : Colors.,
        color: Color(0xFF0C2361),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            letterSpacing: 1.0,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFE0E0E0),
                      Color(0xC4EFEFEF),
                      Color(0xFFE0E0E2),
                      Color(0xFFE0E0E3),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                // child: SingleChildScrollView(
                //   physics: AlwaysScrollableScrollPhysics(),
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 40.0,
                //     vertical: 120.0,
                //   ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/logo.png"),
                          height: 190,
                        ),
                        _buildEmailTF(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildPasswordTF(),

                        SizedBox(
                          height: 20.0,
                        ),
                        // _buildShowPasswordCheckbox(),
                        _buildLoginBtn(),
                      ],
                    ),
                  ],
                ),
              ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
