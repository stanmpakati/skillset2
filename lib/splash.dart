import 'package:flutter/material.dart';
import 'package:newserverdemo/auth_wrapper.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState(){
    super.initState();

    _statusForm().then(
      (status) {
        if (status) {
           _navigateToLogin();
        }
      }
    );
  }

  Future <bool> _statusForm() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }
      void _navigateToLogin() {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AuthenticationWrapper()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget> [
              Opacity(opacity: 1,
              child: Image.asset('assets/img/logo.png',
              height: 130,
              width: 130,
              ),
              )
            ]
          ),
        )
      ),
    );
  }
}