import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/global_vars.dart';

class Recharge extends StatefulWidget {
  @override
  _RechargeState createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(child: Text(getTranslated(context, "noDataFound"))),
    );  }
}
