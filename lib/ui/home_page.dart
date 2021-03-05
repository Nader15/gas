import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:gas/utils/custom_widgets/drawer.dart';

class HomePage extends StatefulWidget {
  final int currentIndex;

  HomePage({this.currentIndex});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerList(),
      appBar: AppBar(
        backgroundColor: primaryAppColor,
        title: Text(translator.translate('appTitle')),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Center(
        child: Text(
          translator.translate('appTitle'),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
