import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/ui/home_page.dart';
import 'dart:async';
import 'package:gas/utils/colors_file.dart';
import 'package:gas/utils/custom_widgets/custom_button.dart';
import 'package:gas/utils/navigator.dart';

class Verify extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            verfyCode(),
                            verfyCode(),
                            verfyCode(),
                            verfyCode(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 18, top: 41, left: 23, right: 23),
                        child: CustomButton(
                            bttnName: 'تفعيل',
                            bttnHeight: 55,
                            bttnNameSize: 20,
                            onPress: () {
                              navigateAndKeepStack(context, HomePage());
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return SignUpAlert();
                              //     });
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

  Padding verfyCode() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 55,
        width: 60,
        padding: EdgeInsets.only(left: 25, right: 15),
        decoration: BoxDecoration(
            color: greyPrimaryColor.withOpacity(.5),
            borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          keyboardType: TextInputType.number,
          style: TextStyle(color: primaryAppColor,fontSize: 25),
          cursorColor: primaryAppColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '0',
              hintStyle: TextStyle(color: blackColor, fontSize: 23)),
        ),
      ),
    );
  }
}
