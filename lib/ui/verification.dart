import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/ui/home_page.dart';
import 'file:///C:/Users/Shark/AndroidStudioProjects/GitHub-Projects/gas/lib/utils/verification_class.dart';
import 'dart:async';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_button.dart';
import 'package:gas/utils/navigator.dart';

class Verify extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Verify> {
  bool _autoValidate = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  String _onCompleted = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
          child: SafeArea(
            child: Center(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(height: 69),
                    SizedBox(height: 47),
                    Text("كود التفعيل",
                        style:
                            TextStyle(color: primaryAppColor, fontSize: 27)),
                    SizedBox(height: 50),
                    Center(
                      child: VerificationCodeInput(
                        // validation: validatePhone,
                        keyboardType: TextInputType.number,
                        length: 4,
                        autofocus: false,
                        onCompleted: (String value) {
                          print(value);
                          setState(() {
                            _onCompleted = value;
                          });
                        },
                      ),
                    ),
                    // _onCompleted != ""
                    //     ? Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Center(
                    //           child: Text(
                    //             'الكود : $_onCompleted',
                    //           ),
                    //         ),
                    //       )
                    //     : Container(),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 18, top: 41, left: 23, right: 23),
                      child: CustomButton(
                          bttnName: 'تفعيل',
                          bttnHeight: 55,
                          bttnNameSize: 20,
                          onPress: () {
                            _validateInputs();
                            if (_key.currentState.validate()) {
                              navigateAndKeepStack(context, HomePage());
                            }
                          }),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "اعادة ارسال الكود",
                        style: TextStyle(
                          color: primaryAppColor,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
  void _validateInputs() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
  String validatePhone(String value) {
    if (value.length == 0)
      return "*خطأ";
    else if (value.length < 11)
      return '*خطأ';
    else
      return null;
  }
}
