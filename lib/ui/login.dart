import 'package:flutter/material.dart';
import 'package:gas/ui/home_page.dart';
import 'package:gas/ui/verification.dart';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_button.dart';
import 'package:gas/utils/global_vars.dart';
import 'package:gas/utils/navigator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(getTranslated(context, "Login"),
            style:
                TextStyle(fontWeight: FontWeight.w100, color: primaryAppColor)),
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
      child: SingleChildScrollView(
          child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ادخل رقم الجوال الخاص بك للدخول"),
                SizedBox(
                  height: MediaQuery.of(context).size.height/8,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  cursorColor: grey,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey)),
                    labelText: "رقم الجوال",
                    labelStyle: TextStyle(color: grey),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryAppColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        navigateAndKeepStack(context, Verify());
                      },
                      child: Text("تسجيل دخول")),
                ))
              ],
            ),
          )
        ],
      )),
    );
  }
}