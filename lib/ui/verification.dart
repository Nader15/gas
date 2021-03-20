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
      body: Stack(
        children: <Widget>[
          Center(
              child: Stack(
            children: [
              // Image.asset(
              //   'images/bg.png',
              //   fit: BoxFit.cover,
              //   width: MediaQuery.of(context).size.width,
              // ),
              SafeArea(
                child: Center(
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
                              navigateAndKeepStack(context, HomePage());
                              ;
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
              )
            ],
          ))
        ],
      ),
    );
  }
}
