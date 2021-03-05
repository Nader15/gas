import 'package:flutter/material.dart';
import 'package:gas/utils/colors_file.dart';

class CustomButton extends StatelessWidget {
  final double bttnHeight;
  final double bttnWidth;
  final String bttnName;
  final double bttnNameSize;
  final Function onPress;

  CustomButton(
      { this.bttnHeight,
       this.bttnWidth,
       this.bttnName,
       this.bttnNameSize,
       this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ButtonTheme(
            minWidth: bttnWidth,
            height: bttnHeight,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: primaryAppColor,
              child: Text(
                bttnName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: bttnNameSize,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () => onPress,
            )));
  }
}
