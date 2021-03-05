import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gas/APiFunctions/sharedPref/SharedPrefClass.dart';
import 'package:gas/ui/home_page.dart';
import 'package:gas/ui/on_boarding.dart';
import 'package:gas/utils/global_vars.dart';
import 'package:gas/utils/image_file.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      getUserTocken(context).then((value) {
        print("UserTocken:: ${UserTocken}");
        if (UserTocken == "null") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => OnBoarding()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        currentIndex: 0,
                      )));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
              child: Stack(
            children: [
              Image.asset('images/bg.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),
              Center(
                child: Image.asset(
                  APP_LOGO,
                  fit: BoxFit.cover,
                  width: 98,
                  height: 98,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
