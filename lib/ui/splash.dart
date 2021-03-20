import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gas/APiFunctions/sharedPref/SharedPrefClass.dart';
import 'package:gas/ui/home_page.dart';
import 'package:gas/ui/login.dart';
import 'package:gas/ui/on_boarding.dart';
import 'package:gas/utils/navigator.dart';
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
      navigateAndClearStack(context, Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      APP_LOGO,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    ));
  }
}
