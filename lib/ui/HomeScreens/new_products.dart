import 'package:flutter/material.dart';
import 'package:gas/utils/global_vars.dart';

class NewProducts extends StatefulWidget {
  @override
  _NewProductsState createState() => _NewProductsState();
}

class _NewProductsState extends State<NewProducts> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(child: Text(getTranslated(context, "noDataFound"))),
    );
  }
}
